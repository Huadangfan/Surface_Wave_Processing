import numpy as np
from numpy import std, mean
import scipy as sp
import obspy as op
from obspy.signal.filter import envelope
from scipy.fftpack import fft
import sequencer
import seaborn as sb
import matplotlib.pyplot as plt
from matplotlib.widgets import Cursor
# from matplotlib.widgets import RadioButtons
from matplotlib.widgets import CheckButtons
import glob
import os
from os import path as ospath
# import pickle as pik
import math
from alive_progress import alive_bar
import time
from pathlib import Path
# from tqdm import tqdm
# ____________________________________________________________________________
# +------------------ BRIEF -------------------------------------------------+
# | Do: detect the bad window data in a singel peroi                         |
# |     Product the shell script. Moving bad window                          |
# |     are wiritted in the shell.                                           |
# | Time: Feb, 13, 2021                                                      |
# +----------------- HISTORY ------------------------------------------------+-------------+
# | - (add:) interactive PLOT to delet bad data                                            |
# |    - time: Feb, 16, 2021                                                               |
# | - (modify:) change the RadioButton to CheckButton                                      |
# |    - time: Feb, 17, 2021                                                               |
# | - (test:) working on freq 0.017 Hz                                                     |
# |    - time: Feb, 18, 2021                                                               |
# | - (add:) Analyze the STD or Z-score of Lag time and PLOT the Horizontal                |
# |          histogram of z-score                                                          |
# |    - time: Feb, 18, 2021                                                               |
# | - (test:) plot the envelope of data and used for sequencer                             |
# |    - time: Feb, 19, 2021                                                               |
# | - (add:) Analyze the EMD for each single window waveform and Plot the                  |
# |          matrix of EMD                                                                 |
# |    - time: Feb, 19, 2021                                                               |
# | - (modify:) Using subplot2grid to arrange the subplot and delete the total aliver-bar  |
# |    - time: Feb, 19, 2021                                                               |
# | - (modify:) Using the checkButtons status to decide to delet the window data.          |
# |    - time: Feb, 19, 2021                                                               |
# | - (add:) add the condition to decide showing the plotting figure                       |
# |    - time: Feb, 20, 2021                                                               |
# | - (modify) Using for the Southern African                                              |
# |    - time: Mar, 27, 2021                                                               |
# +----------------------------------------------------------------------------------------+
freq = 'f015'
# os.chdir('./{}'.format(freq))  # working on freq: 0.017 Hz
os.chdir('.')


def normalization_normal(data):
    return (data-min(data))/(max(data)-min(data))


# ____________________________________
# >+-------------------------------+<
# >|   Get the ALL events files    |< >
# >|   ONLY work in a single peroi |
# >+-------------------------------+<
fil = sorted(glob.glob('[0,1]*[0,1,2,3,4,5,6,7,8,9]'))
#fil = sorted(glob.glob('0062*'))
fil = [fil_survey1 for fil_survey1 in fil if Path(ospath.join(fil_survey1, './survey1')).is_dir()]
# fil = glob.glob('1824*')
num_files = len(fil)
print(fil)
print(num_files)
badwindow_path = 'bad_window'
# window_peroi = '*BHZ*020.w'  # <Windows data>
window_peroi = '*HZ*{}.w'.format(freq)
DELET_BOOL_VALUE = 0  # define the BOOL VALUE to delet the bad data
txt_font_size = 8
# _____________________________________
# >+--------------------------------+<
# >| loop DO: for each EVENS file   |< >
# >+--------------------------------+<
for n_counter, filename in enumerate(fil):
    # break
    print('==================================')
    print('=== STARTING:{} ==='.format(filename))
    print('==================================')
    DELET_BOOL_VALUE = []  # initilization
    # filename = './05912015.144.14_2'
    os.chdir(ospath.join(filename, 'survey1'))
    # winList = glob.glob('*BHZ*020.w')
    # +---------------------------------+
    # |    check the peroi file exist   |
    # +---------------------------------+
    if len(glob.glob(window_peroi)):
        pass
    else:
        os.chdir('../..')
        continue
    st = op.read(window_peroi)
    print('---- read data -----')
    # st2 = op.read('../05982016.171.09_2/*BHZ*020.w')
    # st = st + st2
    window_npts = int(st[0].stats.npts)

    # +------------------------------------------+
    # |  Plot offset and data processing offset  |
    # +------------------------------------------+
    wavefrom_offset = 1
    data_proce_offset = 0.01  # avoid 0 value

    num_ray = len(st)
    grid = np.arange(window_npts)
    objects_list = []
    objects_raw_data = []
    objects_orig = []
    objects_fft = []
    objects_Net = []
    objects_Name = []
    objects_envelope = []
    objects_depmax = []
    lenght = 0
    objects_true_indices = np.arange(num_ray)
    DELET_BOOL_VALUE = [0]*num_ray

    with alive_bar() as bar:
        # ##### TEST ######
        # u = 900
        # sigm = math.sqrt(1000)
        # y_sig = np.exp(-(grid - u) ** 2 / (2 * sigm ** 2)) / (math.sqrt(2 * math.pi) * sigm)
        # ______________________________________
        # >+---------------------------------+<
        # >|        DATA processing:         |< >
        # >+---------------------------------+<
        for tr in st:
            data = tr.data
            lenght = len(data)
            objects_raw_data.append(data)
            data_freq_domain = np.abs(fft(data))/lenght # normalization
            data_freq_domain = data_freq_domain[range(int(lenght/8))] # half
            data_orig = data
            data_orig = normalization_normal(data=data_orig)
            envelope_wave = envelope(data_orig) + data_proce_offset
            data = abs((data)/(max(data)-min(data))) + \
                data_proce_offset  # normalization
            # data2 = ((data)-min(data))/(max(data)-min(data))+data_proce_offset
            #data = abs((data - np.mean(data))/np.std(data))+0.1
            objects_orig.append(data_orig)
            objects_envelope.append(envelope_wave)
            objects_list.append(data)
            objects_fft.append(data_freq_domain)
            objects_Net.append(tr.stats.network)
            objects_Name.append(tr.stats.station)
            objects_depmax.append(tr.stats.sac.depmax)
            bar()
        # test
        # objects_list.append(abs((y_sig)/(max(y_sig)-min(y_sig)))/1.5+data_proce_offset)
        objects_list = np.array(objects_list)
        objects_orig = np.array(objects_orig)
        objects_fft = np.array(objects_fft)
        objects_raw = np.array(objects_raw_data)
        objects_envelope = np.array(objects_envelope)
        # random the index for test
        # np.random.shuffle(objects_true_indices)
        objects_list_shuffled = objects_list[objects_true_indices, :]
        objects_orig_shuffled = objects_orig[objects_true_indices, :]
        objects_fft_shuffled = objects_fft[objects_true_indices, :]
        #objects_list_shuffled = objects_list
        # +-----------------------------------------------------+
        # | To using freq to sequencer. change the grid to half |
        # +-----------------------------------------------------+
        grid_half = grid[range(int(len(grid)/8))]
        objects_list_shuffled = objects_fft_shuffled
        # #### PLOT before calculate ##########################################
        # plt.figure(1, figsize=(5, 10))
        # plt.title('input dataset')
        # for i, object_data in enumerate(objects_list_shuffled):
        #     object_data_scaled_y = object_data + i*wavefrom_offset
        #     plt.plot(grid, object_data_scaled_y, 'k')
        # #plt.plot(grid, abs((y_sig)/(max(y_sig)-min(y_sig)))/1.5+data_proce_offset+8, 'k')
        # plt.xlabel('x')
        # plt.ylabel('scaled intensity')
        # plt.tight_layout()

        # plt.figure(2, figsize=(5, 4))
        # plt.title("input dataset")
        # plt.pcolormesh(objects_list_shuffled, cmap='seismic')
        # plt.colorbar()
        # plt.xlabel("x")
        # plt.ylabel("original index")
        # plt.tight_layout()

        # plt.show()

        # +---------------------------+
        # | sequencer initialization  |
        # +---------------------------+
        estimator_list = ['EMD', 'energy', 'L2']
        scale_list = [[np.dtype('int64').type(1), np.dtype('int64').type(2), np.dtype('int64').type(4),
                       np.dtype('int64').type(8), np.dtype('int64').type(16), np.dtype('int64').type(32), np.dtype('int64').type(64)], [
            np.dtype('int64').type(1), np.dtype(
                'int64').type(2), np.dtype('int64').type(4),
            np.dtype('int64').type(8), np.dtype('int64').type(16), np.dtype('int64').type(32), np.dtype('int64').type(64)], [
                np.dtype('int64').type(1), np.dtype(
                    'int64').type(2), np.dtype('int64').type(4),
                np.dtype('int64').type(8), np.dtype('int64').type(16), np.dtype('int64').type(32), np.dtype('int64').type(64)]]
        # define the sequencer object with default parameters
        seq = sequencer.Sequencer(grid_half, objects_list_shuffled,
                                  estimator_list, scale_list=scale_list)
        print('-------- calculating --------')
        # outputs will be saved
        output_path = "."
        final_elongation, final_sequence = seq.execute(output_path,
                                                       to_print_progress=False,
                                                       to_average_N_best_estimators=True,
                                                       number_of_best_estimators=1)
        bar()
        # print the final elongation
        print("The MST elongation: ", final_elongation)
        # print the resulting sequence
        print("The resulting sequence: ", final_sequence)

        # >+------------------------------------------------------------+<
        # >| order the input dataset according to the detected sequence |< >
        # >+------------------------------------------------------------+<
        objects_list_ordered = objects_list_shuffled[final_sequence]
        objects_orig_ordered = objects_orig_shuffled[final_sequence]
        objects_envelope_ordered = objects_envelope[final_sequence]
        objects_Net_ordered = [objects_Net[j] for j in final_sequence]
        objects_Name_ordered = [objects_Name[j] for j in final_sequence]
        objects_depmax_ordered = [objects_depmax[j] for j in final_sequence]
        first_subt_last_lag = np.argmax(
            objects_orig_ordered[-1]) - np.argmax(objects_orig_ordered[0])
        print('The Last wave subtra the first wave LAG: {}'.format(
            first_subt_last_lag))
        reverse_BOOL = False
        if(first_subt_last_lag <= -10):
            # +--------------------------------------+
            # |   NOTE < Output in ascending order > |
            # |   Determine the order of delay       |
            # +--------------------------------------+
            objects_list_ordered = objects_list_ordered[::-1]
            objects_orig_ordered = objects_orig_ordered[::-1]
            #objects_orig_shuffled = objects_orig_shuffled[::-1]
            objects_Name_ordered.reverse()
            objects_Net_ordered.reverse()
            objects_depmax_ordered.reverse()
            reverse_BOOL = True
        bar()
        # +------------------------------------+
        # |   Check the orignal data order     |
        # +------------------------------------+
        last_subt_first_orig = np.argmax(
                objects_orig_shuffled[-1]) - np.argmax(objects_orig_shuffled[0])
        # ______________________________________
        # >+---------------------------------+<
        # >|  visualize the ordered dataset  |< >
        # >+---------------------------------+<

        # visualize the envelope waveform
        # plt.figure(1)
        # for i, object_data in enumerate(objects_envelope_ordered[::-1]):
        #     object_data_scaled_y = object_data + i*wavefrom_offset
        #     plt.plot(grid, object_data_scaled_y, 'r')
        #     plt.text(len(object_data_scaled_y)*1.1,
        #              object_data_scaled_y[-1], str(num_ray-i),
        #              verticalalignment='center',
        #              horizontalalignment='center')
        # for i, object_data in enumerate(objects_orig_shuffled[::-1]):
        #     object_data_scaled_y = object_data + i*wavefrom_offset
        #     plt.plot(grid, object_data_scaled_y, 'k')
        #     plt.text(len(object_data_scaled_y)*1.1,
        #              object_data_scaled_y[-1], str(num_ray-i),
        #              verticalalignment='center',
        #              horizontalalignment='center')
        # # plt.gca().invert_yaxis()
        # plt.yticks([])
        # plt.xlabel('x')
        # plt.ylabel('scaled intensity')
        # plt.tight_layout()
        # plt.show()

        plot_nrows = 2
        plot_ncols = 5
        plot_scale = 1
        # for cursor line props
        lineprops = dict(color="hotpink", lw=1.5, linestyle='--')

        fig_total = plt.figure(3, figsize=(15/plot_scale, 12 /
                                           plot_scale), edgecolor='deeppink')

        plt.subplot2grid((plot_nrows, plot_ncols), (0, 0))
        plt.title("input dataset_Original")
        plt.pcolormesh(np.log10(objects_raw), cmap='seismic')
        plt.gca().invert_yaxis()
        plt.colorbar()
        # plt.xlabel("x")
        plt.ylabel("original index")
        bar()

        ax2 = plt.subplot2grid((plot_nrows, plot_ncols), (0, 1))
        plt.title('input dataset')
        if last_subt_first_orig <=10:
            color_line = 'r'
        else:
            color_line = 'k'
        # invert the y axis
        line_input_data = [0]*num_ray
        for i, object_data in enumerate(objects_orig_shuffled[::-1]):
            object_data_scaled_y = object_data + i*wavefrom_offset
            line_input_data[num_ray-i-1], = plt.plot(grid, object_data_scaled_y, color_line)
            plt.text(len(object_data_scaled_y)*1.1,
                     object_data_scaled_y[-1], str(num_ray-i),
                     verticalalignment='center', fontsize=txt_font_size,
                     horizontalalignment='center')
        # plt.gca().invert_yaxis()
        plt.yticks([])
        # plt.xlabel('x')
        plt.ylabel('scaled intensity')
        # plt.tight_layout()
        cursor1 = Cursor(ax2, useblit=True, **lineprops)

        #plt.subplot2grid((plot_nrows, plot_ncols), (1, 2))
        #plt.title("ordered process dataset")
        #plt.pcolormesh(objects_list_ordered, cmap='seismic')
        #plt.gca().invert_yaxis()  # invert the y axis
        #plt.colorbar()
        # plt.xlabel("x")
        # plt.ylabel("original index")
        line_process_data = [0]*num_ray
        ax4 = plt.subplot2grid((plot_nrows, plot_ncols), (1, 3))
        plt.title('ordered process dataset')
        for i, object_data in enumerate(objects_list_ordered[::-1]):
            object_data_scaled_y = object_data + i*wavefrom_offset
            line_process_data[num_ray-i-1], = plt.plot(grid_half, object_data_scaled_y, 'k')
            plt.text(len(object_data_scaled_y)*1.1,
                     object_data_scaled_y[-1], str(num_ray-i),
                     verticalalignment='center', fontsize=txt_font_size,
                     horizontalalignment='center')
        # plt.gca().invert_yaxis()
        plt.yticks([])
        # plt.xlabel('x')
        # plt.ylabel('scaled intensity')
        # plt.tight_layout()
        cursor2 = Cursor(ax4, useblit=True, **lineprops)
        bar()
        
        line_orig_ordered = [0]*num_ray
        ax5 = plt.subplot2grid((plot_nrows, plot_ncols), (0, 2))
        plt.title('orig ordered dataset')
        for i, object_data in enumerate(objects_orig_ordered[::-1]):
            object_data_scaled_y = object_data + i*wavefrom_offset
            line_orig_ordered[num_ray-i-1], = plt.plot(grid, object_data_scaled_y, 'k')
            plt.text(len(object_data_scaled_y)*1.1,
                     object_data_scaled_y[-1], str(num_ray-i),
                     verticalalignment='center', fontsize=txt_font_size,
                     horizontalalignment='center')
        # plt.gca().invert_yaxis()
        plt.yticks([])
        # plt.xlabel('x')
        cursor3 = Cursor(ax5, useblit=True, **lineprops)

        # +------------------------+--------------------------------+
        # |  Determin DELET OR NO  | <foucs on the all window data> |
        # +------------------------+--------------------------------+
        ax0 = plt.axes([0.51, 0.5, 0.1, 0.5],
                       facecolor=(0, 0, 0, 0), frameon=False)
        ax0_new = plt.subplot2grid(
            (plot_nrows, plot_ncols), (0, 4), rowspan=2, colspan=1, frameon=False)
        plt.title('{0} \n ({2}/{3}){1}'.format(
            filename, window_peroi, n_counter+1, num_files), fontweight='heavy')
        delet_objects = [str(x+1) for x in range(num_ray)]
        # radio = RadioButtons(ax0, delet_objects, activecolor='deeppink')
        check = CheckButtons(ax0_new, delet_objects, actives=DELET_BOOL_VALUE)
        bar()
        handle_value = [False]*num_ray
        def deletOrno(label):
            # +-------------------------------------+
            # | define the boolean value of deleted |
            # +-------------------------------------+
            # global DELET_BOOL_VALUE
            # index_wavef = int(label) - 1
            # DELET_BOOL_VALUE[index_wavef] = 1
            global handle_value
            global reverse_BOOL
            index = delet_objects.index(label)
            if reverse_BOOL:
                input_index = final_sequence[::-1][index]
            else:
                input_index = final_sequence[index]
            index_r = num_ray - index - 1
            #boolean = check.get_status()
            if not handle_value[index]:
                #line_orig_ordered[index].set_width(1)
                line_input_data[input_index].set_linestyle('-.')
                line_input_data[input_index].set_color('purple')
                line_orig_ordered[index].set_linestyle('-.')
                line_orig_ordered[index].set_color('purple')
                line_process_data[index].set_color('purple')
                line_process_data[index].set_linestyle('-.')
                barh_handle[index_r].set_color('purple')
                barh_handle_log[index_r].set_color('purple')
                #line_process_data[index].set_width(1)
                handle_value[index] = not handle_value[index]
                #print(handle_value)
                plt.draw()
            else:
                line_input_data[input_index].set_linestyle('-')
                line_input_data[input_index].set_color('k')
                line_orig_ordered[index].set_linestyle('-')
                line_orig_ordered[index].set_color('k')
                line_process_data[index].set_color('k')
                line_process_data[index].set_linestyle('-')
                barh_handle[index_r].set_color('tab:blue')
                barh_handle_log[index_r].set_color('tab:blue')
                handle_value[index] = not handle_value[index]
                #print(handle_value)
                plt.draw()
            pass

        # radio.on_clicked(deletOrno)  # click DELET to mv the last one data
        check.on_clicked(deletOrno)

        # +---------------------+
        # | print output param  |
        # +---------------------+
        estimator_list, scale_list, elongation_list = seq.return_elongation_of_weighted_products_all_metrics_and_scales()
        for i in range(len(estimator_list)):
            print("metric=%s, scale=%s, elongation: %s" % (estimator_list[i],
                                                           scale_list[i],
                                                           elongation_list[i]))

        # +----------------------------------------+
        # | Analyze the STD or Z-score of Lag time |
        # +----------------------------------------+
        # |      PLOT the Horizontal histogram     |
        # +----------------------------------------+
        objects_Lag = np.array([np.argmax(x) for x in objects_list_ordered])
        # calculate the mean and STD
        standardDeviation = std(objects_Lag)
        meanLag = mean(objects_Lag)
        # calculate Z score
        zScoreLag = (objects_Lag - meanLag)/standardDeviation
        ax6 = plt.subplot2grid((plot_nrows, plot_ncols), (0, 3))
        indices = [str(num_ray-v) for v in range(num_ray)]
        # plot the bar_horz map
        plt.grid()
        barh_handle = plt.barh(range(num_ray), abs(zScoreLag[::-1]))
        rect_labels = ['{:.2f}'.format(z_v) for z_v in zScoreLag[::-1]]
        # annotate the value of Z-score at the left of rect
        for value, rect_l, rect in zip(zScoreLag[::-1], rect_labels, barh_handle):
            w = rect.get_width()
            if (value >= 0):
                ax6.text(w, rect.get_y()+rect.get_height()/2,
                         '{}'.format(rect_l), horizontalalignment='left',
                         verticalalignment='center', color='b')
            else:
                ax6.text(w, rect.get_y()+rect.get_height()/2,
                         '{}'.format(rect_l), horizontalalignment='left',
                         verticalalignment='center', color='r')
        # ax5.text(0, -1, 'Lag STD: {:.2f}'.format(standardDeviation))
        ax6.set_yticks(range(num_ray))
        ax6.set_yticklabels(indices, fontsize=txt_font_size)
        plt.xlim([0, 3])
        plt.title('Z-score(Lag STD: {:.2f})'.format(standardDeviation))
        # plt.xlabel('Lag STD: {:.2f}'.format(standardDeviation))
        # plt.xticks(())
        cursor4 = Cursor(ax6, useblit=True, **lineprops)

        # +-------------------------------------------+
        # | Analyze the STD or Z-score of DEPMAX time |
        # +-------------------------------------------+
        # |      PLOT the Horizontal histogram        |
        # +-------------------------------------------+
        objects_depmax_ordered = np.array(objects_depmax_ordered)
        objects_depmax_log = np.log10(objects_depmax_ordered)
        depmax_log_std = std(objects_depmax_log)
        depmax_log_mean = mean(objects_depmax_log)
        zScoreLog = (objects_depmax_log - depmax_log_mean)/depmax_log_std
        ax_4 = plt.subplot2grid((plot_nrows, plot_ncols), (1, 2))
        plt.grid()
        barh_handle_log = plt.barh(range(num_ray), abs(zScoreLog[::-1]))
        rect_labels_log = ['{:.2f}'.format(z_v) for z_v in zScoreLog[::-1]]
        for value, rect_l, rect in zip(objects_depmax_log[::-1], rect_labels_log, barh_handle_log):
            w = rect.get_width()
            if (value >= 0):
                if w > 3:
                    ax_4.text(3.1, rect.get_y()+rect.get_height()/2,
                        '{:.1f}'.format(value), horizontalalignment='left',
                         verticalalignment='center', color='b')
                else:
                    ax_4.text(w, rect.get_y()+rect.get_height()/2,
                        '{:.1f}'.format(value), horizontalalignment='left',
                         verticalalignment='center', color='b')
            else:
                if w>3:
                    ax_4.text(3.1, rect.get_y()+rect.get_height()/2,
                        '{:.1f}'.format(value), horizontalalignment='left',
                         verticalalignment='center', color='r')
                else:
                    ax_4.text(w, rect.get_y()+rect.get_height()/2,
                        '{:.1f}'.format(value), horizontalalignment='left',
                         verticalalignment='center', color='r')
        ax_4.set_yticks(range(num_ray))
        ax_4.set_yticklabels(indices, fontsize=txt_font_size)
        plt.xlim([0, 3])
        plt.title('DEPMAX LOG VALUE')
        cursor5 = Cursor(ax_4, useblit=True, **lineprops)
        # +-----------------------------------------------+
        # | Analyze the EMD distance of surface wave data |
        # +-----------------------------------------------+
        # |          PLOT the EMD distance graphic        |
        # +-----------------------------------------------+
        wasserstein_metric = np.zeros((num_ray, num_ray))  # initilization
        # corr_metrix = np.corrcoef(objects_list_ordered)
        # wasserstein_metric = corr_metrix
        for i_counter, object_data in enumerate(objects_list_ordered):
            for j_counter, object_data_again in enumerate(objects_list_ordered):
                wasserstein_metric[i_counter][j_counter] = sp.stats.wasserstein_distance(
                    object_data, object_data_again)
                bar()
        # sb.heatmap(wasserstein_metric, annot=True)

        ax7 = plt.subplot2grid((plot_nrows, plot_ncols),
                               (1, 0), rowspan=1, colspan=2)
        sb.heatmap(wasserstein_metric*100, annot=False,
                   fmt='.1f', vmin=0, vmax=2.5)
        # plt.gca().invert_yaxis()  # invert the y axis
        ticks_labels = [str(coun+1) for coun in range(num_ray)]
        ax7.xaxis.tick_top()
        plt.yticks(range(num_ray), ticks_labels)
        plt.xticks(range(num_ray), ticks_labels)
        # plt.tight_layout()

        # +-------------------+
        # |  The total title  |
        # +-------------------+
        # fig_total.suptitle('{} \n {}'.format(filename, window_peroi), fontweight='heavy')
        #plt.tight_layout(rect=[0, 0, 0.993, 0.98])  # Total Layout

        # +---------------------------------------------+
        # | Show Figure(determin whether or not)(GUI)   |
        # +---------------------------------------------+
        correlate_threshold = 0.2*100
        z_score_lag_threshold = 2
        z_score_log_threshold = 2
        depmax_diff = 0.9
        if ((wasserstein_metric*100).max() >= correlate_threshold or
                abs(zScoreLag).max() >= z_score_lag_threshold or 
                (abs(zScoreLog).max() >= z_score_log_threshold and 
                    objects_depmax_log.max()-objects_depmax_log.min() > depmax_diff)):
            plt.show()
        # plt.show()
        DELET_BOOL_VALUE = check.get_status()  # get the status of checkbuttons
        print(DELET_BOOL_VALUE)
        # plt.show()

        # # +-------------------------------+
        # # | TEST: PLOT the sequencer data |
        # # +-------------------------------+
        # fig2 = plt.figure(4, figsize=(7.5, 5))

        # fig2_ax3 = plt.subplot2grid((1, 4), (0, 2), rowspan=1, colspan=2)
        # sb.heatmap(wasserstein_metric*100, annot=True, fmt='.1f')
        # # plt.gca().invert_yaxis()  # invert the y axis
        # ticks_labels = [str(coun+1) for coun in range(num_ray)]
        # fig2_ax3.xaxis.tick_top()
        # plt.yticks(range(num_ray), ticks_labels)
        # plt.xticks(range(num_ray), ticks_labels)

        # plt.tight_layout()
        # plt.show()

        print(len(st))
        lag3 = np.argmax(objects_list_ordered[0])
        lag = np.argmax(objects_list_ordered[1])
        lag4 = np.argmax(objects_list_ordered[-1])
        emd1 = sp.stats.wasserstein_distance(
            objects_list_ordered[0], objects_list_ordered[1])
        emd2 = sp.stats.wasserstein_distance(
            objects_list_ordered[0], objects_list_ordered[-1])
        # break

        # +------------------------+
        # |   Writting the info    |
        # +------------------------+
        print('------- write the info in temp txtfile -------')
        f = open('../../tmp_{}_delet_bad_window.txt'.format(freq), 'a')
        print('# ---- {} ----'.format(filename), file=f)
        print('# Theroy:{}, Last:{}'.format(
            (lag-lag3)*num_ray, lag4-lag3), file=f)
        print('# The first EMD:{:5f}, Last:{:5f}'.format(emd1, emd2), file=f)
        booleanValue = np.array(DELET_BOOL_VALUE) 
        if last_subt_first_orig <= -10:
            print('mv ./{}/{} ./{}/{} # maybe INVER??'.format(ospath.join(filename, 'survey1'),
                                                            window_peroi, ospath.join(filename, 'survey1'), 
                                                            badwindow_path), file=f)
        if np.sum(booleanValue):
            for index, single_bool_value in enumerate(booleanValue):
                if single_bool_value:
                    # mv the bad window data
                    print('mv ./{}/*.{}.{}{} ./{}/{}'.format(ospath.join(filename, 'survey1'),
                                                            objects_Net_ordered[index],
                                                            objects_Name_ordered[index],
                                                            window_peroi, ospath.join(filename, 'survey1'), 
                                                            badwindow_path), file=f)
                else:
                    pass
                if not (index-len(booleanValue)+1):
                    print('', file=f)
        else:
            print('', file=f)
        # if DELET_BOOL_VALUE:
        #     # mv the bad window data
        #     print('mv ./{}/*.{}.{}{} {}'.format(filename,
        #                                           objects_Net[-1], objects_Name[-1], window_peroi, badwindow_path), file=f)
        # else:
        #     print('', file=f)
        f.close()
        bar()
        print('==================================')
        print('=== ENDING:{} ==='.format(filename))
        print('==================================')
        os.chdir('../..')

os.chdir('..')
