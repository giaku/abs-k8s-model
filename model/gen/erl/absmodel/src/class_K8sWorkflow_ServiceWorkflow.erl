-module(class_K8sWorkflow_ServiceWorkflow).
-include_lib("../include/abs_types.hrl").
-behaviour(object).
-export([get_val_internal/2,set_val_internal/3,init_internal/0,get_state_for_modelapi/1,implemented_interfaces/0,exported/0]).
-compile(export_all).

implemented_interfaces() -> [ <<"ServiceTask">>, <<"Object">> ].

exported() -> #{  }.

%% --- Internal state and low-level accessors

-record(state,{'class'=class_K8sWorkflow_ServiceWorkflow,'tasks'=null,'workflowBaseline'=null,'pf'=null}).
'init_internal'()->
    #state{}.

 %% K8sWorkflow.abs:35
'get_val_internal'(#state{'tasks'=G},'tasks')->
    G;
 %% K8sWorkflow.abs:35
'get_val_internal'(#state{'workflowBaseline'=G},'workflowBaseline')->
    G;
 %% K8sWorkflow.abs:35
'get_val_internal'(#state{'pf'=G},'pf')->
    G;
'get_val_internal'(_,_)->
    %% Invalid return value; handled by HTTP API when querying for non-existant field.
    %% Will never occur in generated code.
    none.

 %% K8sWorkflow.abs:35
'set_val_internal'(S,'tasks',V)->
    S#state{'tasks'=V};
 %% K8sWorkflow.abs:35
'set_val_internal'(S,'workflowBaseline',V)->
    S#state{'workflowBaseline'=V};
 %% K8sWorkflow.abs:35
'set_val_internal'(S,'pf',V)->
    S#state{'pf'=V}.

'get_state_for_modelapi'(S)->
    [
        { 'tasks', S#state.'tasks' }
        , { 'workflowBaseline', S#state.'workflowBaseline' }
        , { 'pf', S#state.'pf' }
    ].
%% --- Constructor: field initializers and init block

'init'(O=#object{oid=Oid,cog=Cog=#cog{ref=CogRef,dcobj=DC}},[P_tasks,P_workflowBaseline,P_pf,Stack])->
    C=(get(this))#state.class,
    put(vars, #{}),
    put(this, C:set_val_internal(get(this),'tasks',P_tasks)),
    put(this, C:set_val_internal(get(this),'workflowBaseline',P_workflowBaseline)),
    put(this, C:set_val_internal(get(this),'pf',P_pf)),
    gc:register_object(O),
    O.
%% --- Class has no recovery block

%% --- Methods

 %% K8sWorkflow.abs:36
 %% K8sWorkflow.abs:36
'm_executeWorkflow'(O=#object{oid=Oid,cog=Cog=#cog{ref=CogRef,dcobj=DC}},Stack)->
    C=(get(this))#state.class,
    put(vars, #{ 'this' => O }),
    try
         %% K8sWorkflow.abs:37--37
        put(vars, (get(vars))#{'size' => (fun() -> case O of
            null -> throw(dataNullPointerException);
            Callee=#object{oid=Oid,cog=Cog} ->
                %% self-call
                Vars=get(vars),
                Result=C:'m_getSize'(Callee,[O,DC,Vars| Stack]),
                put(vars, Vars),
                Result;
            Callee=#object{oid=ObjRef,cog=Cog} ->
                %% cog-local call
                State=get(this),
                Vars=get(vars),
                cog:object_state_changed(Cog, O, State),
                put(this,cog:get_object_state(Callee#object.cog, Callee)),
                put(task_info,(get(task_info))#task_info{this=Callee}),
                T=object:get_class_from_state(get(this)), % it's the callee state already
                Result=T:'m_getSize'(Callee,[O,DC,Vars,State| Stack]),
                cog:object_state_changed(Callee#object.cog, Callee, get(this)),
                put(task_info,(get(task_info))#task_info{this=O}),
                put(this, cog:get_object_state(Cog, O)),
                put(vars, Vars),
                Result;
            Callee ->
                %% remote call
                TempFuture = cog:create_task(Callee,'m_getSize',[[]],#task_info{method= <<"getSize"/utf8>>},Cog, true),
                future:get_blocking(TempFuture, Cog, [O,DC| Stack])
        end end)()}),
         %% K8sWorkflow.abs:38--38
        put(vars, (get(vars))#{'totalRtDelay' => (fun() -> case O of
            null -> throw(dataNullPointerException);
            Callee=#object{oid=Oid,cog=Cog} ->
                %% self-call
                Vars=get(vars),
                Result=C:'m_execute'(Callee,C:get_val_internal(get(this), 'pf'),[O,DC,Vars| Stack]),
                put(vars, Vars),
                Result;
            Callee=#object{oid=ObjRef,cog=Cog} ->
                %% cog-local call
                V_pf = C:get_val_internal(get(this), 'pf'),
                State=get(this),
                Vars=get(vars),
                cog:object_state_changed(Cog, O, State),
                put(this,cog:get_object_state(Callee#object.cog, Callee)),
                put(task_info,(get(task_info))#task_info{this=Callee}),
                T=object:get_class_from_state(get(this)), % it's the callee state already
                Result=T:'m_execute'(Callee, V_pf,[O,DC,Vars,State| Stack]),
                cog:object_state_changed(Callee#object.cog, Callee, get(this)),
                put(task_info,(get(task_info))#task_info{this=O}),
                put(this, cog:get_object_state(Cog, O)),
                put(vars, Vars),
                Result;
            Callee ->
                %% remote call
                TempFuture = cog:create_task(Callee,'m_execute',[C:get_val_internal(get(this), 'pf'),[]],#task_info{method= <<"execute"/utf8>>},Cog, true),
                future:get_blocking(TempFuture, Cog, [O,DC| Stack])
        end end)()}),
         %% K8sWorkflow.abs:39--39
        put(vars, (get(vars))#{'totalRtDelay' :=  rationals:rdiv(maps:get('totalRtDelay', get(vars)),maps:get('size', get(vars))) }),
         %% K8sWorkflow.abs:42--42
        put(vars, (get(vars))#{'responseTime' => ( rationals:add(C:get_val_internal(get(this), 'workflowBaseline'),maps:get('totalRtDelay', get(vars)))) }),
         %% K8sWorkflow.abs:43--43
        T_1 = builtin:println(Cog,iolist_to_binary([iolist_to_binary([iolist_to_binary([iolist_to_binary([iolist_to_binary([iolist_to_binary([<<"{TIME "/utf8>>, builtin:toString(Cog,m_ABS_StdLib_funs:f_timeValue(Cog,m_ABS_StdLib_funs:f_now(Cog,[O,DC| Stack]),[O,DC| Stack]))]), <<"} "/utf8>>]), <<"WORKFLOW_BASELINE: "/utf8>>]), builtin:toString(Cog,C:get_val_internal(get(this), 'workflowBaseline'))]), <<"  CONSUMPTION_DELAY_RT: "/utf8>>]), builtin:toString(Cog,builtin:float(Cog,maps:get('totalRtDelay', get(vars))))])),
        T_1,
         %% K8sWorkflow.abs:45--45
        maps:get('responseTime', get(vars))
    catch
        _:Exception:Stacktrace ->
            io:format(standard_error, "Uncaught ~s in method executeWorkflow and no recovery block in class definition, killing object ~s~n", [builtin:toString(Cog, Exception), builtin:toString(Cog, O)]),
            io:format(standard_error, "stacktrace: ~tp~n", [Stacktrace]),
            object:die(O, Exception), exit(Exception)
    end.
 %% K8sWorkflow.abs:48
 %% K8sWorkflow.abs:48
'm_execute'(O=#object{oid=Oid,cog=Cog=#cog{ref=CogRef,dcobj=DC}},V_pf_0,Stack)->
    C=(get(this))#state.class,
    put(vars, #{ 'this' => O,
 'pf' => V_pf_0 }),
    try
         %% K8sWorkflow.abs:49--49
        put(vars, (get(vars))#{'totalRtDelay' => 0}),
         %% K8sWorkflow.abs:50--50
        put(vars, (get(vars))#{'timeFuts' => m_ABS_StdLib_funs:f_list(Cog,[],[O,DC| Stack])}),
         %% K8sWorkflow.abs:52--55
        put(vars, (get(vars))#{'tmp602552403' => C:get_val_internal(get(this), 'tasks')}),
         %% K8sWorkflow.abs:52--55
        []=(fun Loop ([])->
            case not (m_ABS_StdLib_funs:f_isEmpty(Cog,maps:get('tmp602552403', get(vars)),[O,DC| Stack])) of
            false -> [];
            true -> receive
                    {stop_world, CogRef} ->
                        cog:task_is_blocked_for_gc(Cog, self(), get(task_info), get(this)),
                        cog:task_is_runnable(Cog,self()),
                        task:wait_for_token(Cog,[O,DC| Stack])
                    after 0 -> ok
                end,
                 %% K8sWorkflow.abs:52--55
                put(vars, (get(vars))#{'tList' => m_ABS_StdLib_funs:f_head(Cog,maps:get('tmp602552403', get(vars)),[O,DC| Stack])}),
                 %% K8sWorkflow.abs:52--55
                put(vars, (get(vars))#{'tmp602552403' := m_ABS_StdLib_funs:f_tail(Cog,maps:get('tmp602552403', get(vars)),[O,DC| Stack])}),
                 %% K8sWorkflow.abs:53--53
                put(vars, (get(vars))#{'timeFut' => cog:create_task(O,'m_executeParallel',[maps:get('tList', get(vars)),[]],#task_info{method= <<"executeParallel"/utf8>>, creation={dataTime,builtin:currentms(Cog)}, proc_deadline=dataInfDuration},Cog,true)}),
                 %% K8sWorkflow.abs:54--54
                put(vars, (get(vars))#{'timeFuts' := m_ABS_StdLib_funs:f_appendright(Cog,maps:get('timeFuts', get(vars)),maps:get('timeFut', get(vars)),[O,DC| Stack])}),
            Loop([])  end end)
        ([]),
         %% K8sWorkflow.abs:57--61
        put(vars, (get(vars))#{'tmp1863410679' => maps:get('timeFuts', get(vars))}),
         %% K8sWorkflow.abs:57--61
        []=(fun Loop ([])->
            case not (m_ABS_StdLib_funs:f_isEmpty(Cog,maps:get('tmp1863410679', get(vars)),[O,DC| Stack])) of
            false -> [];
            true -> receive
                    {stop_world, CogRef} ->
                        cog:task_is_blocked_for_gc(Cog, self(), get(task_info), get(this)),
                        cog:task_is_runnable(Cog,self()),
                        task:wait_for_token(Cog,[O,DC| Stack])
                    after 0 -> ok
                end,
                 %% K8sWorkflow.abs:57--61
                put(vars, (get(vars))#{'tf' => m_ABS_StdLib_funs:f_head(Cog,maps:get('tmp1863410679', get(vars)),[O,DC| Stack])}),
                 %% K8sWorkflow.abs:57--61
                put(vars, (get(vars))#{'tmp1863410679' := m_ABS_StdLib_funs:f_tail(Cog,maps:get('tmp1863410679', get(vars)),[O,DC| Stack])}),
                 %% K8sWorkflow.abs:58--58
                future:await(maps:get('tf', get(vars)), Cog, [O,DC| Stack]),
                ok,
                 %% K8sWorkflow.abs:59--59
                put(vars, (get(vars))#{'t' => future:get_blocking(maps:get('tf', get(vars)), Cog, [O,DC| Stack])}),
                 %% K8sWorkflow.abs:60--60
                put(vars, (get(vars))#{'totalRtDelay' := ( rationals:add(maps:get('totalRtDelay', get(vars)),maps:get('t', get(vars)))) }),
            Loop([])  end end)
        ([]),
         %% K8sWorkflow.abs:63--63
        maps:get('totalRtDelay', get(vars))
    catch
        _:Exception:Stacktrace ->
            io:format(standard_error, "Uncaught ~s in method execute and no recovery block in class definition, killing object ~s~n", [builtin:toString(Cog, Exception), builtin:toString(Cog, O)]),
            io:format(standard_error, "stacktrace: ~tp~n", [Stacktrace]),
            object:die(O, Exception), exit(Exception)
    end.
 %% K8sWorkflow.abs:65
 %% K8sWorkflow.abs:65
'm_executeParallel'(O=#object{oid=Oid,cog=Cog=#cog{ref=CogRef,dcobj=DC}},V_list_0,Stack)->
    C=(get(this))#state.class,
    put(vars, #{ 'this' => O,
 'list' => V_list_0 }),
    try
         %% K8sWorkflow.abs:66--66
        put(vars, (get(vars))#{'rTime' => 0}),
         %% K8sWorkflow.abs:67--67
        put(vars, (get(vars))#{'timeFuts' => m_ABS_StdLib_funs:f_list(Cog,[],[O,DC| Stack])}),
         %% K8sWorkflow.abs:69--72
        put(vars, (get(vars))#{'tmp239290560' => maps:get('list', get(vars))}),
         %% K8sWorkflow.abs:69--72
        []=(fun Loop ([])->
            case not (m_ABS_StdLib_funs:f_isEmpty(Cog,maps:get('tmp239290560', get(vars)),[O,DC| Stack])) of
            false -> [];
            true -> receive
                    {stop_world, CogRef} ->
                        cog:task_is_blocked_for_gc(Cog, self(), get(task_info), get(this)),
                        cog:task_is_runnable(Cog,self()),
                        task:wait_for_token(Cog,[O,DC| Stack])
                    after 0 -> ok
                end,
                 %% K8sWorkflow.abs:69--72
                put(vars, (get(vars))#{'task' => m_ABS_StdLib_funs:f_head(Cog,maps:get('tmp239290560', get(vars)),[O,DC| Stack])}),
                 %% K8sWorkflow.abs:69--72
                put(vars, (get(vars))#{'tmp239290560' := m_ABS_StdLib_funs:f_tail(Cog,maps:get('tmp239290560', get(vars)),[O,DC| Stack])}),
                 %% K8sWorkflow.abs:70--70
                put(vars, (get(vars))#{'timeFut' => cog:create_task(maps:get('task', get(vars)),'m_execute',[C:get_val_internal(get(this), 'pf'),[]],#task_info{method= <<"execute"/utf8>>, creation={dataTime,builtin:currentms(Cog)}, proc_deadline=dataInfDuration},Cog,true)}),
                 %% K8sWorkflow.abs:71--71
                put(vars, (get(vars))#{'timeFuts' := m_ABS_StdLib_funs:f_appendright(Cog,maps:get('timeFuts', get(vars)),maps:get('timeFut', get(vars)),[O,DC| Stack])}),
            Loop([])  end end)
        ([]),
         %% K8sWorkflow.abs:74--78
        put(vars, (get(vars))#{'tmp1286145967' => maps:get('timeFuts', get(vars))}),
         %% K8sWorkflow.abs:74--78
        []=(fun Loop ([])->
            case not (m_ABS_StdLib_funs:f_isEmpty(Cog,maps:get('tmp1286145967', get(vars)),[O,DC| Stack])) of
            false -> [];
            true -> receive
                    {stop_world, CogRef} ->
                        cog:task_is_blocked_for_gc(Cog, self(), get(task_info), get(this)),
                        cog:task_is_runnable(Cog,self()),
                        task:wait_for_token(Cog,[O,DC| Stack])
                    after 0 -> ok
                end,
                 %% K8sWorkflow.abs:74--78
                put(vars, (get(vars))#{'tf' => m_ABS_StdLib_funs:f_head(Cog,maps:get('tmp1286145967', get(vars)),[O,DC| Stack])}),
                 %% K8sWorkflow.abs:74--78
                put(vars, (get(vars))#{'tmp1286145967' := m_ABS_StdLib_funs:f_tail(Cog,maps:get('tmp1286145967', get(vars)),[O,DC| Stack])}),
                 %% K8sWorkflow.abs:75--75
                future:await(maps:get('tf', get(vars)), Cog, [O,DC| Stack]),
                ok,
                 %% K8sWorkflow.abs:76--76
                put(vars, (get(vars))#{'t' => future:get_blocking(maps:get('tf', get(vars)), Cog, [O,DC| Stack])}),
                 %% K8sWorkflow.abs:77--77
                put(vars, (get(vars))#{'rTime' := ( rationals:add(maps:get('rTime', get(vars)),maps:get('t', get(vars)))) }),
            Loop([])  end end)
        ([]),
         %% K8sWorkflow.abs:80--80
        maps:get('rTime', get(vars))
    catch
        _:Exception:Stacktrace ->
            io:format(standard_error, "Uncaught ~s in method executeParallel and no recovery block in class definition, killing object ~s~n", [builtin:toString(Cog, Exception), builtin:toString(Cog, O)]),
            io:format(standard_error, "stacktrace: ~tp~n", [Stacktrace]),
            object:die(O, Exception), exit(Exception)
    end.
 %% K8sWorkflow.abs:83
 %% K8sWorkflow.abs:83
'm_getSize'(O=#object{oid=Oid,cog=Cog=#cog{ref=CogRef,dcobj=DC}},Stack)->
    C=(get(this))#state.class,
    put(vars, #{ 'this' => O }),
    try
         %% K8sWorkflow.abs:84--84
        put(vars, (get(vars))#{'result' => 0}),
         %% K8sWorkflow.abs:86--91
        put(vars, (get(vars))#{'tmp1056151241' => C:get_val_internal(get(this), 'tasks')}),
         %% K8sWorkflow.abs:86--91
        []=(fun Loop ([])->
            case not (m_ABS_StdLib_funs:f_isEmpty(Cog,maps:get('tmp1056151241', get(vars)),[O,DC| Stack])) of
            false -> [];
            true -> receive
                    {stop_world, CogRef} ->
                        cog:task_is_blocked_for_gc(Cog, self(), get(task_info), get(this)),
                        cog:task_is_runnable(Cog,self()),
                        task:wait_for_token(Cog,[O,DC| Stack])
                    after 0 -> ok
                end,
                 %% K8sWorkflow.abs:86--91
                put(vars, (get(vars))#{'tList' => m_ABS_StdLib_funs:f_head(Cog,maps:get('tmp1056151241', get(vars)),[O,DC| Stack])}),
                 %% K8sWorkflow.abs:86--91
                put(vars, (get(vars))#{'tmp1056151241' := m_ABS_StdLib_funs:f_tail(Cog,maps:get('tmp1056151241', get(vars)),[O,DC| Stack])}),
                 %% K8sWorkflow.abs:87--90
                put(vars, (get(vars))#{'tmp1519998011' => maps:get('tList', get(vars))}),
                 %% K8sWorkflow.abs:87--90
                []=(fun Loop ([])->
                    case not (m_ABS_StdLib_funs:f_isEmpty(Cog,maps:get('tmp1519998011', get(vars)),[O,DC| Stack])) of
                    false -> [];
                    true -> receive
                            {stop_world, CogRef} ->
                                cog:task_is_blocked_for_gc(Cog, self(), get(task_info), get(this)),
                                cog:task_is_runnable(Cog,self()),
                                task:wait_for_token(Cog,[O,DC| Stack])
                            after 0 -> ok
                        end,
                         %% K8sWorkflow.abs:87--90
                        put(vars, (get(vars))#{'t' => m_ABS_StdLib_funs:f_head(Cog,maps:get('tmp1519998011', get(vars)),[O,DC| Stack])}),
                         %% K8sWorkflow.abs:87--90
                        put(vars, (get(vars))#{'tmp1519998011' := m_ABS_StdLib_funs:f_tail(Cog,maps:get('tmp1519998011', get(vars)),[O,DC| Stack])}),
                         %% K8sWorkflow.abs:88--88
                        put(vars, (get(vars))#{'tmp472114025' => cog:create_task(maps:get('t', get(vars)),'m_getSize',[[]],#task_info{method= <<"getSize"/utf8>>, creation={dataTime,builtin:currentms(Cog)}, proc_deadline=dataInfDuration},Cog,true)}),
                         %% K8sWorkflow.abs:88--88
                        future:await(maps:get('tmp472114025', get(vars)), Cog, [O,DC| Stack]),
                        ok,
                         %% K8sWorkflow.abs:88--88
                        put(vars, (get(vars))#{'tSize' => future:get_blocking(maps:get('tmp472114025', get(vars)), Cog, [O,DC| Stack])}),
                         %% K8sWorkflow.abs:89--89
                        put(vars, (get(vars))#{'result' := (maps:get('result', get(vars)) + maps:get('tSize', get(vars))) }),
                    Loop([])  end end)
                ([]),
            Loop([])  end end)
        ([]),
         %% K8sWorkflow.abs:93--93
        maps:get('result', get(vars))
    catch
        _:Exception:Stacktrace ->
            io:format(standard_error, "Uncaught ~s in method getSize and no recovery block in class definition, killing object ~s~n", [builtin:toString(Cog, Exception), builtin:toString(Cog, O)]),
            io:format(standard_error, "stacktrace: ~tp~n", [Stacktrace]),
            object:die(O, Exception), exit(Exception)
    end.
