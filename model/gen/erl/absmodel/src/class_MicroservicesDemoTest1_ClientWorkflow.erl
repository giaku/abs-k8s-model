-module(class_MicroservicesDemoTest1_ClientWorkflow).
-include_lib("../include/abs_types.hrl").
-behaviour(object).
-export([get_val_internal/2,set_val_internal/3,init_internal/0,get_state_for_modelapi/1,implemented_interfaces/0,exported/0]).
-compile(export_all).

implemented_interfaces() -> [ <<"Client">>, <<"Object">> ].

exported() -> #{  }.

%% --- Internal state and low-level accessors

-record(state,{'class'=class_MicroservicesDemoTest1_ClientWorkflow,'t'=null,'times'=null,'delay'=null,'timesGranularity'=null}).
'init_internal'()->
    #state{}.

 %% tests/UIO_rt_baseline/MsDemoWf1_RR_320rps.abs:12
'get_val_internal'(#state{'t'=G},'t')->
    G;
 %% tests/UIO_rt_baseline/MsDemoWf1_RR_320rps.abs:12
'get_val_internal'(#state{'times'=G},'times')->
    G;
 %% tests/UIO_rt_baseline/MsDemoWf1_RR_320rps.abs:12
'get_val_internal'(#state{'delay'=G},'delay')->
    G;
 %% tests/UIO_rt_baseline/MsDemoWf1_RR_320rps.abs:12
'get_val_internal'(#state{'timesGranularity'=G},'timesGranularity')->
    G;
'get_val_internal'(_,_)->
    %% Invalid return value; handled by HTTP API when querying for non-existant field.
    %% Will never occur in generated code.
    none.

 %% tests/UIO_rt_baseline/MsDemoWf1_RR_320rps.abs:12
'set_val_internal'(S,'t',V)->
    S#state{'t'=V};
 %% tests/UIO_rt_baseline/MsDemoWf1_RR_320rps.abs:12
'set_val_internal'(S,'times',V)->
    S#state{'times'=V};
 %% tests/UIO_rt_baseline/MsDemoWf1_RR_320rps.abs:12
'set_val_internal'(S,'delay',V)->
    S#state{'delay'=V};
 %% tests/UIO_rt_baseline/MsDemoWf1_RR_320rps.abs:12
'set_val_internal'(S,'timesGranularity',V)->
    S#state{'timesGranularity'=V}.

'get_state_for_modelapi'(S)->
    [
        { 't', S#state.'t' }
        , { 'times', S#state.'times' }
        , { 'delay', S#state.'delay' }
        , { 'timesGranularity', S#state.'timesGranularity' }
    ].
%% --- Constructor: field initializers and init block

'init'(O=#object{oid=Oid,cog=Cog=#cog{ref=CogRef,dcobj=DC}},[P_t,P_times,P_delay,P_timesGranularity,Stack])->
    C=(get(this))#state.class,
    put(vars, #{}),
    put(this, C:set_val_internal(get(this),'t',P_t)),
    put(this, C:set_val_internal(get(this),'times',P_times)),
    put(this, C:set_val_internal(get(this),'delay',P_delay)),
    put(this, C:set_val_internal(get(this),'timesGranularity',P_timesGranularity)),
    gc:register_object(O),
    O.
%% --- Class has no recovery block

%% --- Methods

 %% tests/UIO_rt_baseline/MsDemoWf1_RR_320rps.abs:14
 %% tests/UIO_rt_baseline/MsDemoWf1_RR_320rps.abs:14
'm_start'(O=#object{oid=Oid,cog=Cog=#cog{ref=CogRef,dcobj=DC}},Stack)->
    C=(get(this))#state.class,
    put(vars, #{ 'this' => O }),
    try
         %% tests/UIO_rt_baseline/MsDemoWf1_RR_320rps.abs:15--15
        put(vars, (get(vars))#{'partialResponseTime' => 0}),
         %% tests/UIO_rt_baseline/MsDemoWf1_RR_320rps.abs:16--16
        put(vars, (get(vars))#{'responseTimes' => m_ABS_StdLib_funs:f_list(Cog,[],[O,DC| Stack])}),
         %% tests/UIO_rt_baseline/MsDemoWf1_RR_320rps.abs:17--17
        put(vars, (get(vars))#{'rTimes' => m_ABS_StdLib_funs:f_list(Cog,[],[O,DC| Stack])}),
         %% tests/UIO_rt_baseline/MsDemoWf1_RR_320rps.abs:18--18
        put(vars, (get(vars))#{'counter' => C:get_val_internal(get(this), 'times')}),
         %% tests/UIO_rt_baseline/MsDemoWf1_RR_320rps.abs:20--20
        []=(fun Loop ([])->
            case cmp:gt(maps:get('counter', get(vars)),0) of
            false -> [];
            true -> receive
                    {stop_world, CogRef} ->
                        cog:task_is_blocked_for_gc(Cog, self(), get(task_info), get(this)),
                        cog:task_is_runnable(Cog,self()),
                        task:wait_for_token(Cog,[O,DC| Stack])
                    after 0 -> ok
                end,
                 %% tests/UIO_rt_baseline/MsDemoWf1_RR_320rps.abs:21--21
                put(vars, (get(vars))#{'fTime' => cog:create_task(C:get_val_internal(get(this), 't'),'m_executeWorkflow',[[]],#task_info{method= <<"executeWorkflow"/utf8>>, creation={dataTime,builtin:currentms(Cog)}, proc_deadline=dataInfDuration},Cog,true)}),
                 %% tests/UIO_rt_baseline/MsDemoWf1_RR_320rps.abs:22--22
                put(vars, (get(vars))#{'rTimes' := m_ABS_StdLib_funs:f_appendright(Cog,maps:get('rTimes', get(vars)),maps:get('fTime', get(vars)),[O,DC| Stack])}),
                 %% tests/UIO_rt_baseline/MsDemoWf1_RR_320rps.abs:23--23
                put(vars, (get(vars))#{'counter' := (maps:get('counter', get(vars)) - 1) }),
                 %% tests/UIO_rt_baseline/MsDemoWf1_RR_320rps.abs:25--25
                cog:suspend_current_task_for_duration(Cog,C:get_val_internal(get(this), 'delay'),C:get_val_internal(get(this), 'delay'),[O,DC| Stack]),
                ok,
            Loop([])  end end)
        ([]),
         %% tests/UIO_rt_baseline/MsDemoWf1_RR_320rps.abs:28--28
        put(vars, (get(vars))#{'partialCounter' => C:get_val_internal(get(this), 'timesGranularity')}),
         %% tests/UIO_rt_baseline/MsDemoWf1_RR_320rps.abs:30--43
        put(vars, (get(vars))#{'tmp1984350709' => maps:get('rTimes', get(vars))}),
         %% tests/UIO_rt_baseline/MsDemoWf1_RR_320rps.abs:30--43
        []=(fun Loop ([])->
            case not (m_ABS_StdLib_funs:f_isEmpty(Cog,maps:get('tmp1984350709', get(vars)),[O,DC| Stack])) of
            false -> [];
            true -> receive
                    {stop_world, CogRef} ->
                        cog:task_is_blocked_for_gc(Cog, self(), get(task_info), get(this)),
                        cog:task_is_runnable(Cog,self()),
                        task:wait_for_token(Cog,[O,DC| Stack])
                    after 0 -> ok
                end,
                 %% tests/UIO_rt_baseline/MsDemoWf1_RR_320rps.abs:30--43
                put(vars, (get(vars))#{'tf' => m_ABS_StdLib_funs:f_head(Cog,maps:get('tmp1984350709', get(vars)),[O,DC| Stack])}),
                 %% tests/UIO_rt_baseline/MsDemoWf1_RR_320rps.abs:30--43
                put(vars, (get(vars))#{'tmp1984350709' := m_ABS_StdLib_funs:f_tail(Cog,maps:get('tmp1984350709', get(vars)),[O,DC| Stack])}),
                 %% tests/UIO_rt_baseline/MsDemoWf1_RR_320rps.abs:31--31
                future:await(maps:get('tf', get(vars)), Cog, [O,DC| Stack]),
                ok,
                 %% tests/UIO_rt_baseline/MsDemoWf1_RR_320rps.abs:32--32
                put(vars, (get(vars))#{'t' => future:get_blocking(maps:get('tf', get(vars)), Cog, [O,DC| Stack])}),
                 %% tests/UIO_rt_baseline/MsDemoWf1_RR_320rps.abs:35--35
                put(vars, (get(vars))#{'partialResponseTime' := ( rationals:add(maps:get('partialResponseTime', get(vars)),maps:get('t', get(vars)))) }),
                 %% tests/UIO_rt_baseline/MsDemoWf1_RR_320rps.abs:36--36
                put(vars, (get(vars))#{'partialCounter' := (maps:get('partialCounter', get(vars)) - 1) }),
                 %% tests/UIO_rt_baseline/MsDemoWf1_RR_320rps.abs:37--37
                case cmp:eq(maps:get('partialCounter', get(vars)),0) of
                    true ->  %% tests/UIO_rt_baseline/MsDemoWf1_RR_320rps.abs:38--38
                    put(vars, (get(vars))#{'partialCounter' := C:get_val_internal(get(this), 'timesGranularity')}),
                     %% tests/UIO_rt_baseline/MsDemoWf1_RR_320rps.abs:39--39
                    put(vars, (get(vars))#{'partialResponseTime' :=  rationals:rdiv(maps:get('partialResponseTime', get(vars)),C:get_val_internal(get(this), 'timesGranularity')) }),
                     %% tests/UIO_rt_baseline/MsDemoWf1_RR_320rps.abs:40--40
                    put(vars, (get(vars))#{'responseTimes' := m_ABS_StdLib_funs:f_appendright(Cog,maps:get('responseTimes', get(vars)),maps:get('partialResponseTime', get(vars)),[O,DC| Stack])}),
                     %% tests/UIO_rt_baseline/MsDemoWf1_RR_320rps.abs:41--41
                    put(vars, (get(vars))#{'partialResponseTime' := 0});
                    false ->                 ok
                end,
            Loop([])  end end)
        ([]),
         %% tests/UIO_rt_baseline/MsDemoWf1_RR_320rps.abs:45--45
        maps:get('responseTimes', get(vars))
    catch
        _:Exception:Stacktrace ->
            io:format(standard_error, "Uncaught ~s in method start and no recovery block in class definition, killing object ~s~n", [builtin:toString(Cog, Exception), builtin:toString(Cog, O)]),
            io:format(standard_error, "stacktrace: ~tp~n", [Stacktrace]),
            object:die(O, Exception), exit(Exception)
    end.
