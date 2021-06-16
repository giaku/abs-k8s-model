-module(m_ABS_StdLib_funs).
-compile(export_all).
-include_lib("../include/abs_types.hrl").

'f_and'(Cog=#cog{ref=CogRef},V_a_0,V_b_0,Stack)->
    (V_a_0) and (V_b_0).

'f_not'(Cog=#cog{ref=CogRef},V_a_0,Stack)->
    not (V_a_0).

'f_max'(Cog=#cog{ref=CogRef},V_a_0,V_b_0,Stack)->
    case cmp:gt(V_a_0,V_b_0) of
        true -> V_a_0;
        false -> V_b_0
    end.

'f_min'(Cog=#cog{ref=CogRef},V_a_0,V_b_0,Stack)->
    case cmp:lt(V_a_0,V_b_0) of
        true -> V_a_0;
        false -> V_b_0
    end.

'f_abs'(Cog=#cog{ref=CogRef},V_x_0,Stack)->
    case cmp:gt(V_x_0,0) of
        true -> V_x_0;
        false -> rationals:neg( V_x_0)
    end.

'f_pow'(Cog=#cog{ref=CogRef},V_b_0,V_n_0,Stack)->
    case cmp:lt(V_n_0,0) of
        true ->  rationals:rdiv(1,m_ABS_StdLib_funs:f_pow(Cog,V_b_0,( - V_n_0),Stack)) ;
        false -> begin
            case V_n_0 of
                
                0->1;
                _->( rationals:mul(V_b_0,m_ABS_StdLib_funs:f_pow(Cog,V_b_0,(V_n_0 - 1) ,Stack))) 
            end
        end
    end.

'f_sqrt_newton'(Cog=#cog{ref=CogRef},V_x_0,V_estimate_0,V_epsilon_0,Stack)->
    (fun (V_next_0)->case cmp:lt(m_ABS_StdLib_funs:f_abs(Cog,( rationals:sub(V_estimate_0,V_next_0)) ,Stack),V_epsilon_0) of
        true -> V_estimate_0;
        false -> m_ABS_StdLib_funs:f_sqrt_newton(Cog,V_x_0,V_next_0,V_epsilon_0,Stack)
    end end( rationals:rdiv(( rationals:add(V_estimate_0, rationals:rdiv(V_x_0,V_estimate_0) )) ,2) )).

'f_sqrt'(Cog=#cog{ref=CogRef},V_x_0,Stack)->
    builtin.

'f_log'(Cog=#cog{ref=CogRef},V_x_0,Stack)->
    builtin.

'f_exp'(Cog=#cog{ref=CogRef},V_x_0,Stack)->
    builtin.

'f_exp_newton_helper'(Cog=#cog{ref=CogRef},V_acc_0,V_x_0,V_next_round_0,V_numerator_0,V_denominator_0,V_epsilon_0,Stack)->
    (fun (V_next_0)->case cmp:lt(m_ABS_StdLib_funs:f_abs(Cog,V_next_0,Stack),V_epsilon_0) of
        true -> ( rationals:add(V_acc_0,V_next_0)) ;
        false -> m_ABS_StdLib_funs:f_exp_newton_helper(Cog,( rationals:add(V_acc_0,V_next_0)) ,V_x_0,(V_next_round_0 + 1) ,( rationals:mul(V_numerator_0,V_x_0)) ,(V_denominator_0 * V_next_round_0) ,V_epsilon_0,Stack)
    end end( rationals:rdiv(( rationals:mul(V_numerator_0,V_x_0)) ,(V_denominator_0 * V_next_round_0) ) )).

'f_exp_newton'(Cog=#cog{ref=CogRef},V_x_0,V_epsilon_0,Stack)->
    case cmp:lt(V_x_0,0) of
        true ->  rationals:rdiv(1,m_ABS_StdLib_funs:f_exp_newton_helper(Cog,( rationals:add(( rationals:sub(1,V_x_0)) , rationals:rdiv(( rationals:mul(V_x_0,V_x_0)) ,2) )) ,rationals:neg( V_x_0),3,( rationals:mul(V_x_0,V_x_0)) ,2,V_epsilon_0,Stack)) ;
        false -> m_ABS_StdLib_funs:f_exp_newton_helper(Cog,( rationals:add(( rationals:add(1,V_x_0)) , rationals:rdiv(( rationals:mul(V_x_0,V_x_0)) ,2) )) ,V_x_0,3,( rationals:mul(V_x_0,V_x_0)) ,2,V_epsilon_0,Stack)
    end.

'f_random'(Cog=#cog{ref=CogRef},V_below_0,Stack)->
    builtin.

'f_truncate'(Cog=#cog{ref=CogRef},V_a_0,Stack)->
    builtin.

'f_float'(Cog=#cog{ref=CogRef},V_a_0,Stack)->
    builtin.

'f_rat'(Cog=#cog{ref=CogRef},V_f_0,Stack)->
    builtin.

'f_floor'(Cog=#cog{ref=CogRef},V_f_0,Stack)->
    builtin.

'f_ceil'(Cog=#cog{ref=CogRef},V_f_0,Stack)->
    builtin.

'f_numerator'(Cog=#cog{ref=CogRef},V_a_0,Stack)->
    builtin.

'f_denominator'(Cog=#cog{ref=CogRef},V_a_0,Stack)->
    builtin.

'f_isJust'(Cog=#cog{ref=CogRef},V_a_0,Stack)->
    begin
        case V_a_0 of
            
            {dataJust,V_j_0}->true;
            dataNothing->false;
            _ -> io:format("No match for a at abs/lang/abslang.abs:172~n"), 
            exit(dataPatternMatchFailException)
        end
    end.

'f_isLeft'(Cog=#cog{ref=CogRef},V_val_0,Stack)->
    begin
        case V_val_0 of
            
            {dataLeft,V_x_0}->true;
            _->false
        end
    end.

'f_isRight'(Cog=#cog{ref=CogRef},V_val_0,Stack)->
    not (m_ABS_StdLib_funs:f_isLeft(Cog,V_val_0,Stack)).

'f_trd'(Cog=#cog{ref=CogRef},V_t_0,Stack)->
    begin
        case V_t_0 of
            
            {dataTriple,_,_,V_val_0}->V_val_0;
            _ -> io:format("No match for t at abs/lang/abslang.abs:187~n"), 
            exit(dataPatternMatchFailException)
        end
    end.

'f_set'(Cog=#cog{ref=CogRef},V_l_0,Stack)->
    begin
        case V_l_0 of
            
            []->dataEmptySet;
            [V_x_0 | V_xs_0]->m_ABS_StdLib_funs:f_insertElement(Cog,m_ABS_StdLib_funs:f_set(Cog,V_xs_0,Stack),V_x_0,Stack);
            _ -> io:format("No match for l at abs/lang/abslang.abs:200~n"), 
            exit(dataPatternMatchFailException)
        end
    end.

'f_contains'(Cog=#cog{ref=CogRef},V_ss_0,V_e_0,Stack)->
    begin
        case V_ss_0 of
            
            dataEmptySet->false;
            {dataInsert,V_e_0,_}->true;
            {dataInsert,V_x_0,V_xs_0}->case cmp:gt(V_x_0,V_e_0) of
                true -> false;
                false -> m_ABS_StdLib_funs:f_contains(Cog,V_xs_0,V_e_0,Stack)
            end;
            _ -> io:format("No match for ss at abs/lang/abslang.abs:209~n"), 
            exit(dataPatternMatchFailException)
        end
    end.

'f_emptySet'(Cog=#cog{ref=CogRef},V_xs_0,Stack)->
    cmp:eq(V_xs_0,dataEmptySet).

'f_size'(Cog=#cog{ref=CogRef},V_xs_0,Stack)->
    begin
        case V_xs_0 of
            
            dataEmptySet->0;
            {dataInsert,V_s_0,V_ss_0}->(1 + m_ABS_StdLib_funs:f_size(Cog,V_ss_0,Stack)) ;
            _ -> io:format("No match for xs at abs/lang/abslang.abs:224~n"), 
            exit(dataPatternMatchFailException)
        end
    end.

'f_elements'(Cog=#cog{ref=CogRef},V_xs_0,Stack)->
    begin
        case V_xs_0 of
            
            dataEmptySet->[];
            {dataInsert,V_s_0,V_ss_0}->[V_s_0 | m_ABS_StdLib_funs:f_elements(Cog,V_ss_0,Stack)];
            _ -> io:format("No match for xs at abs/lang/abslang.abs:233~n"), 
            exit(dataPatternMatchFailException)
        end
    end.

'f_union'(Cog=#cog{ref=CogRef},V_set1_0,V_set2_0,Stack)->
    begin
        case V_set1_0 of
            
            dataEmptySet->V_set2_0;
            {dataInsert,V_e1_0,V_ss1_0}->begin
                case V_set2_0 of
                    
                    dataEmptySet->V_set1_0;
                    {dataInsert,V_e1_0,V_ss2_0}->{ dataInsert,V_e1_0,m_ABS_StdLib_funs:f_union(Cog,V_ss1_0,V_ss2_0,Stack)};
                    {dataInsert,V_e2_0,V_ss2_1}->case cmp:lt(V_e1_0,V_e2_0) of
                        true -> { dataInsert,V_e1_0,m_ABS_StdLib_funs:f_union(Cog,V_ss1_0,V_set2_0,Stack)};
                        false -> { dataInsert,V_e2_0,m_ABS_StdLib_funs:f_union(Cog,V_set1_0,V_ss2_1,Stack)}
                    end;
                    _ -> io:format("No match for set2 at abs/lang/abslang.abs:244~n"), 
                    exit(dataPatternMatchFailException)
                end
            end;
            _ -> io:format("No match for set1 at abs/lang/abslang.abs:242~n"), 
            exit(dataPatternMatchFailException)
        end
    end.

'f_intersection'(Cog=#cog{ref=CogRef},V_set1_0,V_set2_0,Stack)->
    begin
        case V_set1_0 of
            
            dataEmptySet->dataEmptySet;
            {dataInsert,V_e1_0,V_ss1_0}->begin
                case V_set2_0 of
                    
                    dataEmptySet->dataEmptySet;
                    {dataInsert,V_e1_0,V_ss2_0}->{ dataInsert,V_e1_0,m_ABS_StdLib_funs:f_intersection(Cog,V_ss1_0,V_ss2_0,Stack)};
                    {dataInsert,V_e2_0,V_ss2_1}->case cmp:lt(V_e1_0,V_e2_0) of
                        true -> m_ABS_StdLib_funs:f_intersection(Cog,V_ss1_0,V_set2_0,Stack);
                        false -> m_ABS_StdLib_funs:f_intersection(Cog,V_set1_0,V_ss2_1,Stack)
                    end;
                    _ -> io:format("No match for set2 at abs/lang/abslang.abs:260~n"), 
                    exit(dataPatternMatchFailException)
                end
            end;
            _ -> io:format("No match for set1 at abs/lang/abslang.abs:258~n"), 
            exit(dataPatternMatchFailException)
        end
    end.

'f_difference'(Cog=#cog{ref=CogRef},V_set1_0,V_set2_0,Stack)->
    begin
        case V_set1_0 of
            
            dataEmptySet->dataEmptySet;
            {dataInsert,V_e1_0,V_ss1_0}->begin
                case V_set2_0 of
                    
                    dataEmptySet->V_set1_0;
                    {dataInsert,V_e1_0,V_ss2_0}->m_ABS_StdLib_funs:f_difference(Cog,V_ss1_0,V_ss2_0,Stack);
                    {dataInsert,V_e2_0,V_ss2_1}->case cmp:lt(V_e1_0,V_e2_0) of
                        true -> { dataInsert,V_e1_0,m_ABS_StdLib_funs:f_difference(Cog,V_ss1_0,V_set2_0,Stack)};
                        false -> m_ABS_StdLib_funs:f_difference(Cog,V_set1_0,V_ss2_1,Stack)
                    end;
                    _ -> io:format("No match for set2 at abs/lang/abslang.abs:277~n"), 
                    exit(dataPatternMatchFailException)
                end
            end;
            _ -> io:format("No match for set1 at abs/lang/abslang.abs:275~n"), 
            exit(dataPatternMatchFailException)
        end
    end.

'f_isSubset'(Cog=#cog{ref=CogRef},V_maybe_subset_0,V_set_0,Stack)->
    begin
        case V_maybe_subset_0 of
            
            dataEmptySet->true;
            {dataInsert,V_elem_0,V_rest_0}->(m_ABS_StdLib_funs:f_contains(Cog,V_set_0,V_elem_0,Stack)) and (m_ABS_StdLib_funs:f_isSubset(Cog,V_rest_0,V_set_0,Stack));
            _ -> io:format("No match for maybe_subset at abs/lang/abslang.abs:292~n"), 
            exit(dataPatternMatchFailException)
        end
    end.

'f_insertElement'(Cog=#cog{ref=CogRef},V_xs_0,V_e_0,Stack)->
    begin
        case V_xs_0 of
            
            dataEmptySet->{ dataInsert,V_e_0,dataEmptySet};
            {dataInsert,V_e_0,_}->V_xs_0;
            {dataInsert,V_x_0,V_ss_0}->case cmp:lt(V_e_0,V_x_0) of
                true -> { dataInsert,V_e_0,V_xs_0};
                false -> { dataInsert,V_x_0,m_ABS_StdLib_funs:f_insertElement(Cog,V_ss_0,V_e_0,Stack)}
            end;
            _ -> io:format("No match for xs at abs/lang/abslang.abs:303~n"), 
            exit(dataPatternMatchFailException)
        end
    end.

'f_remove'(Cog=#cog{ref=CogRef},V_xs_0,V_e_0,Stack)->
    begin
        case V_xs_0 of
            
            dataEmptySet->dataEmptySet;
            {dataInsert,V_e_0,V_ss_0}->V_ss_0;
            {dataInsert,V_x_0,V_ss_1}->case cmp:lt(V_e_0,V_x_0) of
                true -> V_xs_0;
                false -> { dataInsert,V_x_0,m_ABS_StdLib_funs:f_remove(Cog,V_ss_1,V_e_0,Stack)}
            end;
            _ -> io:format("No match for xs at abs/lang/abslang.abs:313~n"), 
            exit(dataPatternMatchFailException)
        end
    end.

'f_take'(Cog=#cog{ref=CogRef},V_ss_0,Stack)->
    begin
        case V_ss_0 of
            
            {dataInsert,V_e_0,_}->V_e_0;
            _ -> io:format("No match for ss at abs/lang/abslang.abs:325~n"), 
            exit(dataPatternMatchFailException)
        end
    end.

'f_takeMaybe'(Cog=#cog{ref=CogRef},V_ss_0,Stack)->
    begin
        case V_ss_0 of
            
            dataEmptySet->dataNothing;
            {dataInsert,V_e_0,_}->{ dataJust,V_e_0};
            _ -> io:format("No match for ss at abs/lang/abslang.abs:333~n"), 
            exit(dataPatternMatchFailException)
        end
    end.

'f_hasNext'(Cog=#cog{ref=CogRef},V_s_0,Stack)->
    not (m_ABS_StdLib_funs:f_emptySet(Cog,V_s_0,Stack)).

'f_next'(Cog=#cog{ref=CogRef},V_s_0,Stack)->
    begin
        case V_s_0 of
            
            {dataInsert,V_e_0,V_set2_0}->{ dataPair,V_set2_0,V_e_0};
            _ -> io:format("No match for s at abs/lang/abslang.abs:345~n"), 
            exit(dataPatternMatchFailException)
        end
    end.

'f_list'(Cog=#cog{ref=CogRef},V_l_0,Stack)->
    V_l_0.

'f_length'(_, V_list, _) -> length(V_list).

'f_isEmpty'(_, V_list, _) -> V_list == [].

'f_nth'(_, V_list, N, _) -> try
    lists:nth(N + 1, V_list)
  catch _:_ -> exit(dataPatternMatchFailException)
end.

'f_without'(_, V_list, V_p, _) -> lists:filter(fun (X) -> not cmp:eq(X, V_p) end, V_list).

'f_concatenate'(_, V_list1, V_list2, _) ->  V_list1 ++ V_list2.

'f_appendright'(_, V_list, V_p, _) ->  V_list ++ [V_p].

'f_reverse'(_, V_list, _) ->  lists:reverse(V_list).

'f_copy'(_, V_p, N, _) ->  lists:duplicate(N, V_p).

'f_map'(Cog=#cog{ref=CogRef},V_l_0,Stack)->
    begin
        case V_l_0 of
            
            []->dataEmptyMap;
            [V_hd_0 | V_tl_0]->{ dataInsertAssoc,V_hd_0,m_ABS_StdLib_funs:f_map(Cog,V_tl_0,Stack)};
            _ -> io:format("No match for l at abs/lang/abslang.abs:425~n"), 
            exit(dataPatternMatchFailException)
        end
    end.

'f_emptyMap'(Cog=#cog{ref=CogRef},V_map_0,Stack)->
    cmp:eq(V_map_0,dataEmptyMap).

'f_removeKey'(Cog=#cog{ref=CogRef},V_map_0,V_key_0,Stack)->
    begin
        case V_map_0 of
            
            dataEmptyMap->V_map_0;
            {dataInsertAssoc,{dataPair,V_key_0,_},V_m_0}->V_m_0;
            {dataInsertAssoc,V_pair_0,V_tail_0}->{ dataInsertAssoc,V_pair_0,m_ABS_StdLib_funs:f_removeKey(Cog,V_tail_0,V_key_0,Stack)};
            _ -> io:format("No match for map at abs/lang/abslang.abs:436~n"), 
            exit(dataPatternMatchFailException)
        end
    end.

'f_values'(Cog=#cog{ref=CogRef},V_map_0,Stack)->
    begin
        case V_map_0 of
            
            dataEmptyMap->[];
            {dataInsertAssoc,{dataPair,_,V_elem_0},V_tail_0}->[V_elem_0 | m_ABS_StdLib_funs:f_values(Cog,V_tail_0,Stack)];
            _ -> io:format("No match for map at abs/lang/abslang.abs:444~n"), 
            exit(dataPatternMatchFailException)
        end
    end.

'f_keys'(Cog=#cog{ref=CogRef},V_map_0,Stack)->
    begin
        case V_map_0 of
            
            dataEmptyMap->dataEmptySet;
            {dataInsertAssoc,{dataPair,V_a_0,_},V_tail_0}->m_ABS_StdLib_funs:f_insertElement(Cog,m_ABS_StdLib_funs:f_keys(Cog,V_tail_0,Stack),V_a_0,Stack);
            _ -> io:format("No match for map at abs/lang/abslang.abs:453~n"), 
            exit(dataPatternMatchFailException)
        end
    end.

'f_entries'(Cog=#cog{ref=CogRef},V_map_0,Stack)->
    begin
        case V_map_0 of
            
            dataEmptyMap->[];
            {dataInsertAssoc,V_e_0,V_tail_0}->[V_e_0 | m_ABS_StdLib_funs:f_entries(Cog,V_tail_0,Stack)];
            _ -> io:format("No match for map at abs/lang/abslang.abs:462~n"), 
            exit(dataPatternMatchFailException)
        end
    end.

'f_lookup'(Cog=#cog{ref=CogRef},V_ms_0,V_k_0,Stack)->
    begin
        case V_ms_0 of
            
            {dataInsertAssoc,{dataPair,V_k_0,V_y_0},_}->{ dataJust,V_y_0};
            {dataInsertAssoc,_,V_tm_0}->m_ABS_StdLib_funs:f_lookup(Cog,V_tm_0,V_k_0,Stack);
            dataEmptyMap->dataNothing;
            _ -> io:format("No match for ms at abs/lang/abslang.abs:471~n"), 
            exit(dataPatternMatchFailException)
        end
    end.

'f_lookupMaybe'(Cog=#cog{ref=CogRef},V_ms_0,V_k_0,Stack)->
    m_ABS_StdLib_funs:f_lookup(Cog,V_ms_0,V_k_0,Stack).

'f_lookupUnsafe'(Cog=#cog{ref=CogRef},V_ms_0,V_k_0,Stack)->
    m_ABS_StdLib_funs:f_fromJust(Cog,m_ABS_StdLib_funs:f_lookup(Cog,V_ms_0,V_k_0,Stack),Stack).

'f_lookupDefault'(Cog=#cog{ref=CogRef},V_ms_0,V_k_0,V_d_0,Stack)->
    begin
        case V_ms_0 of
            
            {dataInsertAssoc,{dataPair,V_k_0,V_y_0},_}->V_y_0;
            {dataInsertAssoc,_,V_tm_0}->m_ABS_StdLib_funs:f_lookupDefault(Cog,V_tm_0,V_k_0,V_d_0,Stack);
            dataEmptyMap->V_d_0;
            _ -> io:format("No match for ms at abs/lang/abslang.abs:494~n"), 
            exit(dataPatternMatchFailException)
        end
    end.

'f_insert'(Cog=#cog{ref=CogRef},V_map_0,V_p_0,Stack)->
    { dataInsertAssoc,V_p_0,V_map_0}.

'f_put'(Cog=#cog{ref=CogRef},V_ms_0,V_k_0,V_v_0,Stack)->
    begin
        case V_ms_0 of
            
            dataEmptyMap->{ dataInsertAssoc,{ dataPair,V_k_0,V_v_0},dataEmptyMap};
            {dataInsertAssoc,{dataPair,V_k_0,_},V_ts_0}->{ dataInsertAssoc,{ dataPair,V_k_0,V_v_0},V_ts_0};
            {dataInsertAssoc,V_p_0,V_ts_1}->{ dataInsertAssoc,V_p_0,m_ABS_StdLib_funs:f_put(Cog,V_ts_1,V_k_0,V_v_0,Stack)};
            _ -> io:format("No match for ms at abs/lang/abslang.abs:511~n"), 
            exit(dataPatternMatchFailException)
        end
    end.

'f_intToString'(Cog=#cog{ref=CogRef},V_n_0,Stack)->
    builtin:toString(Cog,V_n_0).

'f_substr'(Cog=#cog{ref=CogRef},V_str_0,V_start_0,V_length_0,Stack)->
    builtin.

'f_strlen'(Cog=#cog{ref=CogRef},V_str_0,Stack)->
    builtin.

'f_toString'(Cog=#cog{ref=CogRef},V_t_0,Stack)->
    builtin.

'f_currentms'(Cog=#cog{ref=CogRef},Stack)->
    builtin.

'f_now'(Cog=#cog{ref=CogRef},Stack)->
    { dataTime,builtin:currentms(Cog)}.

'f_ms_since_model_start'(Cog=#cog{ref=CogRef},Stack)->
    builtin.

'f_timeDifference'(Cog=#cog{ref=CogRef},V_t1_0,V_t2_0,Stack)->
    m_ABS_StdLib_funs:f_abs(Cog,( rationals:sub(m_ABS_StdLib_funs:f_timeValue(Cog,V_t2_0,Stack),m_ABS_StdLib_funs:f_timeValue(Cog,V_t1_0,Stack))) ,Stack).

'f_timeLessThan'(Cog=#cog{ref=CogRef},V_t1_0,V_t2_0,Stack)->
    cmp:lt(m_ABS_StdLib_funs:f_timeValue(Cog,V_t1_0,Stack),m_ABS_StdLib_funs:f_timeValue(Cog,V_t2_0,Stack)).

'f_isDurationInfinite'(Cog=#cog{ref=CogRef},V_d_0,Stack)->
    begin
        case V_d_0 of
            
            {dataDuration,_}->false;
            dataInfDuration->true;
            _ -> io:format("No match for d at abs/lang/abslang.abs:570~n"), 
            exit(dataPatternMatchFailException)
        end
    end.

'f_addDuration'(Cog=#cog{ref=CogRef},V_t_0,V_d_0,Stack)->
    { dataTime,( rationals:add(m_ABS_StdLib_funs:f_timeValue(Cog,V_t_0,Stack),m_ABS_StdLib_funs:f_durationValue(Cog,V_d_0,Stack))) }.

'f_subtractDuration'(Cog=#cog{ref=CogRef},V_t_0,V_d_0,Stack)->
    { dataTime,( rationals:sub(m_ABS_StdLib_funs:f_timeValue(Cog,V_t_0,Stack),m_ABS_StdLib_funs:f_durationValue(Cog,V_d_0,Stack))) }.

'f_durationLessThan'(Cog=#cog{ref=CogRef},V_d1_0,V_d2_0,Stack)->
    begin
        case V_d1_0 of
            
            {dataDuration,V_v1_0}->begin
                case V_d2_0 of
                    
                    {dataDuration,V_v2_0}->cmp:lt(V_v1_0,V_v2_0);
                    dataInfDuration->true;
                    _ -> io:format("No match for d2 at abs/lang/abslang.abs:580~n"), 
                    exit(dataPatternMatchFailException)
                end
            end;
            dataInfDuration->false;
            _ -> io:format("No match for d1 at abs/lang/abslang.abs:579~n"), 
            exit(dataPatternMatchFailException)
        end
    end.

'f_lowlevelDeadline'(Cog=#cog{ref=CogRef},Stack)->
    builtin.

'f_deadline'(Cog=#cog{ref=CogRef},Stack)->
    begin
        case cmp:lt(builtin:lowlevelDeadline(Cog),0) of
            
            true->dataInfDuration;
            false->{ dataDuration,builtin:lowlevelDeadline(Cog)};
            _ -> io:format("No match for LTExp(FnApp(),IntLiteral(0)) at abs/lang/abslang.abs:590~n"), 
            exit(dataPatternMatchFailException)
        end
    end.

'f_subtractFromDuration'(Cog=#cog{ref=CogRef},V_d_0,V_v_0,Stack)->
    begin
        case V_d_0 of
            
            dataInfDuration->dataInfDuration;
            {dataDuration,V_x_0}->{ dataDuration,( rationals:sub(V_x_0,V_v_0)) };
            _ -> io:format("No match for d at abs/lang/abslang.abs:596~n"), 
            exit(dataPatternMatchFailException)
        end
    end.

'f_watch'(Cog=#cog{ref=CogRef},V_val_0,Stack)->
    builtin.

'f_watchEx'(Cog=#cog{ref=CogRef},V_val_0,V_info_0,Stack)->
    builtin.

'f_println'(Cog=#cog{ref=CogRef},V_s_0,Stack)->
    builtin.

'f_print'(Cog=#cog{ref=CogRef},V_s_0,Stack)->
    builtin.

'f_readln'(Cog=#cog{ref=CogRef},Stack)->
    builtin.

'f_fromJust'(Cog=#cog{ref=CogRef},V_data_0,Stack)->
    begin
        case V_data_0 of
            
            {dataJust,V_res_0}->V_res_0;
            _ -> io:format("No match for data at abs/lang/abslang.abs:169~n"), 
            exit(dataPatternMatchFailException)
        end
    end.

'f_left'(Cog=#cog{ref=CogRef},V_data_0,Stack)->
    begin
        case V_data_0 of
            
            {dataLeft,V_res_0}->V_res_0;
            _ -> io:format("No match for data at abs/lang/abslang.abs:174~n"), 
            exit(dataPatternMatchFailException)
        end
    end.

'f_right'(Cog=#cog{ref=CogRef},V_data_0,Stack)->
    begin
        case V_data_0 of
            
            {dataRight,V_res_0}->V_res_0;
            _ -> io:format("No match for data at abs/lang/abslang.abs:174~n"), 
            exit(dataPatternMatchFailException)
        end
    end.

'f_fst'(Cog=#cog{ref=CogRef},V_data_0,Stack)->
    begin
        case V_data_0 of
            
            {dataPair,V_res_0,_}->V_res_0;
            _ -> io:format("No match for data at abs/lang/abslang.abs:182~n"), 
            exit(dataPatternMatchFailException)
        end
    end.

'f_snd'(Cog=#cog{ref=CogRef},V_data_0,Stack)->
    begin
        case V_data_0 of
            
            {dataPair,_,V_res_0}->V_res_0;
            _ -> io:format("No match for data at abs/lang/abslang.abs:182~n"), 
            exit(dataPatternMatchFailException)
        end
    end.

'f_trdT'(Cog=#cog{ref=CogRef},V_data_0,Stack)->
    begin
        case V_data_0 of
            
            {dataTriple,_,_,V_res_0}->V_res_0;
            _ -> io:format("No match for data at abs/lang/abslang.abs:184~n"), 
            exit(dataPatternMatchFailException)
        end
    end.

'f_fstT'(Cog=#cog{ref=CogRef},V_data_0,Stack)->
    begin
        case V_data_0 of
            
            {dataTriple,V_res_0,_,_}->V_res_0;
            _ -> io:format("No match for data at abs/lang/abslang.abs:184~n"), 
            exit(dataPatternMatchFailException)
        end
    end.

'f_sndT'(Cog=#cog{ref=CogRef},V_data_0,Stack)->
    begin
        case V_data_0 of
            
            {dataTriple,_,V_res_0,_}->V_res_0;
            _ -> io:format("No match for data at abs/lang/abslang.abs:184~n"), 
            exit(dataPatternMatchFailException)
        end
    end.

'f_head'(Cog=#cog{ref=CogRef},V_data_0,Stack)->
    begin
        case V_data_0 of
            
            [V_res_0 | _]->V_res_0;
            _ -> io:format("No match for data at abs/lang/abslang.abs:350~n"), 
            exit(dataPatternMatchFailException)
        end
    end.

'f_tail'(Cog=#cog{ref=CogRef},V_data_0,Stack)->
    begin
        case V_data_0 of
            
            [_ | V_res_0]->V_res_0;
            _ -> io:format("No match for data at abs/lang/abslang.abs:350~n"), 
            exit(dataPatternMatchFailException)
        end
    end.

'f_timeValue'(Cog=#cog{ref=CogRef},V_data_0,Stack)->
    begin
        case V_data_0 of
            
            {dataTime,V_res_0}->V_res_0;
            _ -> io:format("No match for data at abs/lang/abslang.abs:553~n"), 
            exit(dataPatternMatchFailException)
        end
    end.

'f_durationValue'(Cog=#cog{ref=CogRef},V_data_0,Stack)->
    begin
        case V_data_0 of
            
            {dataDuration,V_res_0}->V_res_0;
            _ -> io:format("No match for data at abs/lang/abslang.abs:568~n"), 
            exit(dataPatternMatchFailException)
        end
    end.

