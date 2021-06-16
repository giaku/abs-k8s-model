-module(m_K8sUtil_funs).
-compile(export_all).
-include_lib("../include/abs_types.hrl").

'f_res_refresh_scheduler'(Cog=#cog{ref=CogRef},V_queue_0,Stack)->
    (fun (V_monitors_0)->case not (m_ABS_StdLib_funs:f_isEmpty(Cog,V_monitors_0,Stack)) of
        true -> m_ABS_StdLib_funs:f_head(Cog,V_monitors_0,Stack);
        false -> m_ABS_StdLib_funs:f_head(Cog,V_queue_0,Stack)
    end end(m_K8sUtil_funs:f_filter_ABS_StdLib_Anon0__(Cog,V_queue_0,Stack))).

'f_reset_availCpu_scheduler'(Cog=#cog{ref=CogRef},V_queue_0,Stack)->
    (fun (V_refresh_0)->case not (m_ABS_StdLib_funs:f_isEmpty(Cog,V_refresh_0,Stack)) of
        true -> m_ABS_StdLib_funs:f_head(Cog,V_refresh_0,Stack);
        false -> m_ABS_StdLib_funs:f_nth(Cog,V_queue_0,builtin:random(Cog,m_ABS_StdLib_funs:f_length(Cog,V_queue_0,Stack)),Stack)
    end end(m_K8sUtil_funs:f_filter_ABS_StdLib_Anon1__(Cog,V_queue_0,Stack))).

'f_node_reset_resources_scheduler'(Cog=#cog{ref=CogRef},V_queue_0,Stack)->
    (fun (V_others_0)->case not (m_ABS_StdLib_funs:f_isEmpty(Cog,V_others_0,Stack)) of
        true -> m_K8sUtil_funs:f_oldestInQueue(Cog,V_others_0,Stack);
        false -> m_ABS_StdLib_funs:f_head(Cog,V_queue_0,Stack)
    end end(m_K8sUtil_funs:f_filter_ABS_StdLib_Anon2__(Cog,V_queue_0,Stack))).

'f_oldestInQueue'(Cog=#cog{ref=CogRef},V_queue_0,Stack)->
    m_K8sUtil_funs:f_foldl_ABS_StdLib_Anon3__(Cog,V_queue_0,m_ABS_StdLib_funs:f_head(Cog,V_queue_0,Stack),Stack).

'f_weightedLeastReqLbPolicy_scheduler'(Cog=#cog{ref=CogRef},V_queue_0,Stack)->
    (fun (V_others_0)->case not (m_ABS_StdLib_funs:f_isEmpty(Cog,V_others_0,Stack)) of
        true -> m_ABS_StdLib_funs:f_head(Cog,V_others_0,Stack);
        false -> m_ABS_StdLib_funs:f_head(Cog,V_queue_0,Stack)
    end end(m_K8sUtil_funs:f_filter_ABS_StdLib_Anon4__(Cog,V_queue_0,Stack))).

'f_infRatValue'(Cog=#cog{ref=CogRef},V_x_0,Stack)->
    begin
        case V_x_0 of
            
            {dataFin,V_y_0}->V_y_0;
            _->0
        end
    end.

'f_maybeZero'(Cog=#cog{ref=CogRef},V_x_0,Stack)->
    begin
        case V_x_0 of
            
            {dataJust,V_y_0}->V_y_0;
            _->0
        end
    end.

'f_cycleIntList'(Cog=#cog{ref=CogRef},V_x_0,Stack)->
    begin
        case V_x_0 of
            
            [V_h_0 | V_t_0]->m_ABS_StdLib_funs:f_appendright(Cog,V_t_0,V_h_0,Stack);
            _->V_x_0
        end
    end.

'f_polFuncEval'(Cog=#cog{ref=CogRef},V_pf_0,V_value_0,Stack)->
    case m_ABS_StdLib_funs:f_isEmpty(Cog,m_K8sUtil_funs:f_thresholds(Cog,V_pf_0,Stack),Stack) of
        true -> m_K8sUtil_funs:f_polEval(Cog,m_ABS_StdLib_funs:f_head(Cog,m_K8sUtil_funs:f_coeffList(Cog,V_pf_0,Stack),Stack),V_value_0,Stack);
        false -> case cmp:le(V_value_0,m_ABS_StdLib_funs:f_head(Cog,m_K8sUtil_funs:f_thresholds(Cog,V_pf_0,Stack),Stack)) of
            true -> m_K8sUtil_funs:f_polEval(Cog,m_ABS_StdLib_funs:f_head(Cog,m_K8sUtil_funs:f_coeffList(Cog,V_pf_0,Stack),Stack),V_value_0,Stack);
            false -> m_K8sUtil_funs:f_polFuncEval(Cog,{ dataPolyFunction,m_ABS_StdLib_funs:f_without(Cog,m_K8sUtil_funs:f_coeffList(Cog,V_pf_0,Stack),m_ABS_StdLib_funs:f_head(Cog,m_K8sUtil_funs:f_coeffList(Cog,V_pf_0,Stack),Stack),Stack),m_ABS_StdLib_funs:f_without(Cog,m_K8sUtil_funs:f_thresholds(Cog,V_pf_0,Stack),m_ABS_StdLib_funs:f_head(Cog,m_K8sUtil_funs:f_thresholds(Cog,V_pf_0,Stack),Stack),Stack)},V_value_0,Stack)
        end
    end.

'f_polEval'(Cog=#cog{ref=CogRef},V_coefficients_0,V_value_0,Stack)->
    m_K8sUtil_funs:f_foldl_ABS_StdLib_Anon5__(Cog,V_coefficients_0,0.0,V_value_0,Stack).

'f_formatInt3'(Cog=#cog{ref=CogRef},V_x_0,Stack)->
    case cmp:lt(V_x_0,10) of
        true -> iolist_to_binary([<<"  "/utf8>>, builtin:toString(Cog,V_x_0)]);
        false -> case cmp:lt(V_x_0,100) of
            true -> iolist_to_binary([<<" "/utf8>>, builtin:toString(Cog,V_x_0)]);
            false -> builtin:toString(Cog,V_x_0)
        end
    end.

'f_memory'(Cog=#cog{ref=CogRef},V_data_0,Stack)->
    begin
        case V_data_0 of
            
            {dataRequest,_,_,V_res_0,_,_,_}->V_res_0;
            _ -> io:format("No match for data at K8sUtil.abs:13~n"), 
            exit(dataPatternMatchFailException)
        end
    end.

'f_requestType'(Cog=#cog{ref=CogRef},V_data_0,Stack)->
    begin
        case V_data_0 of
            
            {dataRequest,V_res_0,_,_,_,_,_}->V_res_0;
            _ -> io:format("No match for data at K8sUtil.abs:13~n"), 
            exit(dataPatternMatchFailException)
        end
    end.

'f_timeBaseline'(Cog=#cog{ref=CogRef},V_data_0,Stack)->
    begin
        case V_data_0 of
            
            {dataRequest,_,_,_,_,V_res_0,_}->V_res_0;
            _ -> io:format("No match for data at K8sUtil.abs:13~n"), 
            exit(dataPatternMatchFailException)
        end
    end.

'f_requestCost'(Cog=#cog{ref=CogRef},V_data_0,Stack)->
    begin
        case V_data_0 of
            
            {dataRequest,_,V_res_0,_,_,_,_}->V_res_0;
            _ -> io:format("No match for data at K8sUtil.abs:13~n"), 
            exit(dataPatternMatchFailException)
        end
    end.

'f_batchSize'(Cog=#cog{ref=CogRef},V_data_0,Stack)->
    begin
        case V_data_0 of
            
            {dataRequest,_,_,_,V_res_0,_,_}->V_res_0;
            _ -> io:format("No match for data at K8sUtil.abs:13~n"), 
            exit(dataPatternMatchFailException)
        end
    end.

'f_cpuSysLoadPerCostUnit'(Cog=#cog{ref=CogRef},V_data_0,Stack)->
    begin
        case V_data_0 of
            
            {dataRequest,_,_,_,_,_,V_res_0}->V_res_0;
            _ -> io:format("No match for data at K8sUtil.abs:13~n"), 
            exit(dataPatternMatchFailException)
        end
    end.

'f_cpuCsmpt'(Cog=#cog{ref=CogRef},V_data_0,Stack)->
    begin
        case V_data_0 of
            
            {dataServiceState,V_res_0,_,_}->V_res_0;
            _ -> io:format("No match for data at K8sUtil.abs:15~n"), 
            exit(dataPatternMatchFailException)
        end
    end.

'f_cpuRatio'(Cog=#cog{ref=CogRef},V_data_0,Stack)->
    begin
        case V_data_0 of
            
            {dataServiceState,_,_,V_res_0}->V_res_0;
            _ -> io:format("No match for data at K8sUtil.abs:15~n"), 
            exit(dataPatternMatchFailException)
        end
    end.

'f_memoryCsmpt'(Cog=#cog{ref=CogRef},V_data_0,Stack)->
    begin
        case V_data_0 of
            
            {dataServiceState,_,V_res_0,_}->V_res_0;
            _ -> io:format("No match for data at K8sUtil.abs:15~n"), 
            exit(dataPatternMatchFailException)
        end
    end.

'f_costGranularity'(Cog=#cog{ref=CogRef},V_data_0,Stack)->
    begin
        case V_data_0 of
            
            {dataPodConfig,_,_,_,_,_,V_res_0}->V_res_0;
            _ -> io:format("No match for data at K8sUtil.abs:17~n"), 
            exit(dataPatternMatchFailException)
        end
    end.

'f_monitorCycle'(Cog=#cog{ref=CogRef},V_data_0,Stack)->
    begin
        case V_data_0 of
            
            {dataPodConfig,_,V_res_0,_,_,_,_}->V_res_0;
            _ -> io:format("No match for data at K8sUtil.abs:17~n"), 
            exit(dataPatternMatchFailException)
        end
    end.

'f_cpuLimit'(Cog=#cog{ref=CogRef},V_data_0,Stack)->
    begin
        case V_data_0 of
            
            {dataPodConfig,_,_,_,_,V_res_0,_}->V_res_0;
            _ -> io:format("No match for data at K8sUtil.abs:17~n"), 
            exit(dataPatternMatchFailException)
        end
    end.

'f_memoryCooldown'(Cog=#cog{ref=CogRef},V_data_0,Stack)->
    begin
        case V_data_0 of
            
            {dataPodConfig,_,_,V_res_0,_,_,_}->V_res_0;
            _ -> io:format("No match for data at K8sUtil.abs:17~n"), 
            exit(dataPatternMatchFailException)
        end
    end.

'f_compUnitSize'(Cog=#cog{ref=CogRef},V_data_0,Stack)->
    begin
        case V_data_0 of
            
            {dataPodConfig,V_res_0,_,_,_,_,_}->V_res_0;
            _ -> io:format("No match for data at K8sUtil.abs:17~n"), 
            exit(dataPatternMatchFailException)
        end
    end.

'f_cpuRequest'(Cog=#cog{ref=CogRef},V_data_0,Stack)->
    begin
        case V_data_0 of
            
            {dataPodConfig,_,_,_,V_res_0,_,_}->V_res_0;
            _ -> io:format("No match for data at K8sUtil.abs:17~n"), 
            exit(dataPatternMatchFailException)
        end
    end.

'f_upscaleThreshold'(Cog=#cog{ref=CogRef},V_data_0,Stack)->
    begin
        case V_data_0 of
            
            {dataServiceConfig,_,_,_,_,_,V_res_0,_,_}->V_res_0;
            _ -> io:format("No match for data at K8sUtil.abs:19~n"), 
            exit(dataPatternMatchFailException)
        end
    end.

'f_downscalePeriod'(Cog=#cog{ref=CogRef},V_data_0,Stack)->
    begin
        case V_data_0 of
            
            {dataServiceConfig,_,_,_,_,_,_,_,V_res_0}->V_res_0;
            _ -> io:format("No match for data at K8sUtil.abs:19~n"), 
            exit(dataPatternMatchFailException)
        end
    end.

'f_startingPods'(Cog=#cog{ref=CogRef},V_data_0,Stack)->
    begin
        case V_data_0 of
            
            {dataServiceConfig,_,V_res_0,_,_,_,_,_,_}->V_res_0;
            _ -> io:format("No match for data at K8sUtil.abs:18~n"), 
            exit(dataPatternMatchFailException)
        end
    end.

'f_name'(Cog=#cog{ref=CogRef},V_data_0,Stack)->
    begin
        case V_data_0 of
            
            {dataServiceConfig,V_res_0,_,_,_,_,_,_,_}->V_res_0;
            _ -> io:format("No match for data at K8sUtil.abs:18~n"), 
            exit(dataPatternMatchFailException)
        end
    end.

'f_minPods'(Cog=#cog{ref=CogRef},V_data_0,Stack)->
    begin
        case V_data_0 of
            
            {dataServiceConfig,_,_,V_res_0,_,_,_,_,_}->V_res_0;
            _ -> io:format("No match for data at K8sUtil.abs:18~n"), 
            exit(dataPatternMatchFailException)
        end
    end.

'f_scalerCycle'(Cog=#cog{ref=CogRef},V_data_0,Stack)->
    begin
        case V_data_0 of
            
            {dataServiceConfig,_,_,_,_,V_res_0,_,_,_}->V_res_0;
            _ -> io:format("No match for data at K8sUtil.abs:18~n"), 
            exit(dataPatternMatchFailException)
        end
    end.

'f_maxPods'(Cog=#cog{ref=CogRef},V_data_0,Stack)->
    begin
        case V_data_0 of
            
            {dataServiceConfig,_,_,_,V_res_0,_,_,_,_}->V_res_0;
            _ -> io:format("No match for data at K8sUtil.abs:18~n"), 
            exit(dataPatternMatchFailException)
        end
    end.

'f_downscaleThreshold'(Cog=#cog{ref=CogRef},V_data_0,Stack)->
    begin
        case V_data_0 of
            
            {dataServiceConfig,_,_,_,_,_,_,V_res_0,_}->V_res_0;
            _ -> io:format("No match for data at K8sUtil.abs:19~n"), 
            exit(dataPatternMatchFailException)
        end
    end.

'f_nodeName'(Cog=#cog{ref=CogRef},V_data_0,Stack)->
    begin
        case V_data_0 of
            
            {dataPodState,_,_,V_res_0,_,_,_}->V_res_0;
            _ -> io:format("No match for data at K8sUtil.abs:21~n"), 
            exit(dataPatternMatchFailException)
        end
    end.

'f_cpuConsumption'(Cog=#cog{ref=CogRef},V_data_0,Stack)->
    begin
        case V_data_0 of
            
            {dataPodState,_,_,_,V_res_0,_,_}->V_res_0;
            _ -> io:format("No match for data at K8sUtil.abs:21~n"), 
            exit(dataPatternMatchFailException)
        end
    end.

'f_memoryConsumption'(Cog=#cog{ref=CogRef},V_data_0,Stack)->
    begin
        case V_data_0 of
            
            {dataPodState,_,_,_,_,V_res_0,_}->V_res_0;
            _ -> io:format("No match for data at K8sUtil.abs:21~n"), 
            exit(dataPatternMatchFailException)
        end
    end.

'f_serviceName'(Cog=#cog{ref=CogRef},V_data_0,Stack)->
    begin
        case V_data_0 of
            
            {dataPodState,V_res_0,_,_,_,_,_}->V_res_0;
            _ -> io:format("No match for data at K8sUtil.abs:21~n"), 
            exit(dataPatternMatchFailException)
        end
    end.

'f_podID'(Cog=#cog{ref=CogRef},V_data_0,Stack)->
    begin
        case V_data_0 of
            
            {dataPodState,_,V_res_0,_,_,_,_}->V_res_0;
            _ -> io:format("No match for data at K8sUtil.abs:21~n"), 
            exit(dataPatternMatchFailException)
        end
    end.

'f_consumptionRatio'(Cog=#cog{ref=CogRef},V_data_0,Stack)->
    begin
        case V_data_0 of
            
            {dataPodState,_,_,_,_,_,V_res_0}->V_res_0;
            _ -> io:format("No match for data at K8sUtil.abs:21~n"), 
            exit(dataPatternMatchFailException)
        end
    end.

'f_requestedCpu'(Cog=#cog{ref=CogRef},V_data_0,Stack)->
    begin
        case V_data_0 of
            
            {dataNodeState,_,_,_,_,_,_,V_res_0}->V_res_0;
            _ -> io:format("No match for data at K8sUtil.abs:22~n"), 
            exit(dataPatternMatchFailException)
        end
    end.

'f_cpuLoad'(Cog=#cog{ref=CogRef},V_data_0,Stack)->
    begin
        case V_data_0 of
            
            {dataNodeState,_,_,V_res_0,_,_,_,_}->V_res_0;
            _ -> io:format("No match for data at K8sUtil.abs:22~n"), 
            exit(dataPatternMatchFailException)
        end
    end.

'f_totalCpu'(Cog=#cog{ref=CogRef},V_data_0,Stack)->
    begin
        case V_data_0 of
            
            {dataNodeState,_,_,_,_,V_res_0,_,_}->V_res_0;
            _ -> io:format("No match for data at K8sUtil.abs:22~n"), 
            exit(dataPatternMatchFailException)
        end
    end.

'f_totalMemory'(Cog=#cog{ref=CogRef},V_data_0,Stack)->
    begin
        case V_data_0 of
            
            {dataNodeState,_,_,_,_,_,V_res_0,_}->V_res_0;
            _ -> io:format("No match for data at K8sUtil.abs:22~n"), 
            exit(dataPatternMatchFailException)
        end
    end.

'f_nName'(Cog=#cog{ref=CogRef},V_data_0,Stack)->
    begin
        case V_data_0 of
            
            {dataNodeState,V_res_0,_,_,_,_,_,_}->V_res_0;
            _ -> io:format("No match for data at K8sUtil.abs:22~n"), 
            exit(dataPatternMatchFailException)
        end
    end.

'f_nOfPods'(Cog=#cog{ref=CogRef},V_data_0,Stack)->
    begin
        case V_data_0 of
            
            {dataNodeState,_,V_res_0,_,_,_,_,_}->V_res_0;
            _ -> io:format("No match for data at K8sUtil.abs:22~n"), 
            exit(dataPatternMatchFailException)
        end
    end.

'f_allocatedMemory'(Cog=#cog{ref=CogRef},V_data_0,Stack)->
    begin
        case V_data_0 of
            
            {dataNodeState,_,_,_,V_res_0,_,_,_}->V_res_0;
            _ -> io:format("No match for data at K8sUtil.abs:22~n"), 
            exit(dataPatternMatchFailException)
        end
    end.

'f_thresholds'(Cog=#cog{ref=CogRef},V_data_0,Stack)->
    begin
        case V_data_0 of
            
            {dataPolyFunction,_,V_res_0}->V_res_0;
            _ -> io:format("No match for data at K8sUtil.abs:73~n"), 
            exit(dataPatternMatchFailException)
        end
    end.

'f_coeffList'(Cog=#cog{ref=CogRef},V_data_0,Stack)->
    begin
        case V_data_0 of
            
            {dataPolyFunction,V_res_0,_}->V_res_0;
            _ -> io:format("No match for data at K8sUtil.abs:73~n"), 
            exit(dataPatternMatchFailException)
        end
    end.

'f_filter_ABS_StdLib_Anon0__'(Cog=#cog{ref=CogRef},V_list_0,Stack)->
    begin
        case V_list_0 of
            
            []->[];
            [V_x1111111111_0 | V_xs1111111111_0]->(fun (V_filtered_0)->case (fun (V_x_0)->cmp:eq(builtin:method(Cog,V_x_0),<<"resourcesRefresh"/utf8>>) end(V_x1111111111_0)) of
                true -> [V_x1111111111_0 | V_filtered_0];
                false -> V_filtered_0
            end end(m_K8sUtil_funs:f_filter_ABS_StdLib_Anon0__(Cog,V_xs1111111111_0,Stack)));
            _ -> io:format("No match for list at abs/lang/abslang.abs:0~n"), 
            exit(dataPatternMatchFailException)
        end
    end.

'f_filter_ABS_StdLib_Anon1__'(Cog=#cog{ref=CogRef},V_list_0,Stack)->
    begin
        case V_list_0 of
            
            []->[];
            [V_x1111111111_0 | V_xs1111111111_0]->(fun (V_filtered_0)->case (fun (V_x_0)->cmp:eq(builtin:method(Cog,V_x_0),<<"refreshAvailableCpu"/utf8>>) end(V_x1111111111_0)) of
                true -> [V_x1111111111_0 | V_filtered_0];
                false -> V_filtered_0
            end end(m_K8sUtil_funs:f_filter_ABS_StdLib_Anon1__(Cog,V_xs1111111111_0,Stack)));
            _ -> io:format("No match for list at abs/lang/abslang.abs:0~n"), 
            exit(dataPatternMatchFailException)
        end
    end.

'f_filter_ABS_StdLib_Anon2__'(Cog=#cog{ref=CogRef},V_list_0,Stack)->
    begin
        case V_list_0 of
            
            []->[];
            [V_x1111111111_0 | V_xs1111111111_0]->(fun (V_filtered_0)->case (fun (V_x_0)->cmp:eq(builtin:method(Cog,V_x_0),<<"resetResources"/utf8>>) end(V_x1111111111_0)) of
                true -> [V_x1111111111_0 | V_filtered_0];
                false -> V_filtered_0
            end end(m_K8sUtil_funs:f_filter_ABS_StdLib_Anon2__(Cog,V_xs1111111111_0,Stack)));
            _ -> io:format("No match for list at abs/lang/abslang.abs:0~n"), 
            exit(dataPatternMatchFailException)
        end
    end.

'f_foldl_ABS_StdLib_Anon3__'(Cog=#cog{ref=CogRef},V_list_0,V_val_0,Stack)->
    begin
        case V_list_0 of
            
            []->V_val_0;
            [V_x1111111111_0 | V_xs1111111111_0]->m_K8sUtil_funs:f_foldl_ABS_StdLib_Anon3__(Cog,V_xs1111111111_0,(fun (V_b_0)->(fun (V_a_0)->case m_ABS_StdLib_funs:f_timeLessThan(Cog,builtin:arrival(Cog,V_a_0),builtin:arrival(Cog,V_b_0),Stack) of
                true -> V_a_0;
                false -> V_b_0
            end end(V_x1111111111_0)) end(V_val_0)),Stack);
            _ -> io:format("No match for list at abs/lang/abslang.abs:0~n"), 
            exit(dataPatternMatchFailException)
        end
    end.

'f_filter_ABS_StdLib_Anon4__'(Cog=#cog{ref=CogRef},V_list_0,Stack)->
    begin
        case V_list_0 of
            
            []->[];
            [V_x1111111111_0 | V_xs1111111111_0]->(fun (V_filtered_0)->case (fun (V_x_0)->cmp:eq(builtin:method(Cog,V_x_0),<<"refreshPods"/utf8>>) end(V_x1111111111_0)) of
                true -> [V_x1111111111_0 | V_filtered_0];
                false -> V_filtered_0
            end end(m_K8sUtil_funs:f_filter_ABS_StdLib_Anon4__(Cog,V_xs1111111111_0,Stack)));
            _ -> io:format("No match for list at abs/lang/abslang.abs:0~n"), 
            exit(dataPatternMatchFailException)
        end
    end.

'f_foldl_ABS_StdLib_Anon5__'(Cog=#cog{ref=CogRef},V_list_0,V_val_0,V_value__0___0,Stack)->
    begin
        case V_list_0 of
            
            []->V_val_0;
            [V_x1111111111_0 | V_xs1111111111_0]->m_K8sUtil_funs:f_foldl_ABS_StdLib_Anon5__(Cog,V_xs1111111111_0,(fun (V_b_0)->(fun (V_a_0)->(fun (V_value_0)->((V_b_0 * V_value_0)  + V_a_0)  end(V_value__0___0)) end(V_x1111111111_0)) end(V_val_0)),V_value__0___0,Stack);
            _ -> io:format("No match for list at abs/lang/abslang.abs:0~n"), 
            exit(dataPatternMatchFailException)
        end
    end.

