-module(class_K8sService_ServiceObject).
-include_lib("../include/abs_types.hrl").
-behaviour(object).
-export([get_val_internal/2,set_val_internal/3,init_internal/0,get_state_for_modelapi/1,implemented_interfaces/0,exported/0]).
-compile(export_all).

implemented_interfaces() -> [ <<"Service">>, <<"Object">> ].

exported() -> #{  }.

%% --- Internal state and low-level accessors

-record(state,{'class'=class_K8sService_ServiceObject,'sConfig'=null,'pConfig'=null,'policy'=null,'lb'=null,'scaler'=null,'ep'=null}).
'init_internal'()->
    #state{}.

 %% K8sService.abs:27
'get_val_internal'(#state{'sConfig'=G},'sConfig')->
    G;
 %% K8sService.abs:27
'get_val_internal'(#state{'pConfig'=G},'pConfig')->
    G;
 %% K8sService.abs:27
'get_val_internal'(#state{'policy'=G},'policy')->
    G;
 %% K8sService.abs:28
'get_val_internal'(#state{'lb'=G},'lb')->
    G;
 %% K8sService.abs:29
'get_val_internal'(#state{'scaler'=G},'scaler')->
    G;
 %% K8sService.abs:30
'get_val_internal'(#state{'ep'=G},'ep')->
    G;
'get_val_internal'(_,_)->
    %% Invalid return value; handled by HTTP API when querying for non-existant field.
    %% Will never occur in generated code.
    none.

 %% K8sService.abs:27
'set_val_internal'(S,'sConfig',V)->
    S#state{'sConfig'=V};
 %% K8sService.abs:27
'set_val_internal'(S,'pConfig',V)->
    S#state{'pConfig'=V};
 %% K8sService.abs:27
'set_val_internal'(S,'policy',V)->
    S#state{'policy'=V};
 %% K8sService.abs:28
'set_val_internal'(S,'lb',V)->
    S#state{'lb'=V};
 %% K8sService.abs:29
'set_val_internal'(S,'scaler',V)->
    S#state{'scaler'=V};
 %% K8sService.abs:30
'set_val_internal'(S,'ep',V)->
    S#state{'ep'=V}.

'get_state_for_modelapi'(S)->
    [
        { 'sConfig', S#state.'sConfig' }
        , { 'pConfig', S#state.'pConfig' }
        , { 'policy', S#state.'policy' }
        , { 'lb', S#state.'lb' }
        , { 'scaler', S#state.'scaler' }
        , { 'ep', S#state.'ep' }
    ].
%% --- Constructor: field initializers and init block

'init'(O=#object{oid=Oid,cog=Cog=#cog{ref=CogRef,dcobj=DC}},[P_sConfig,P_pConfig,P_policy,Stack])->
    C=(get(this))#state.class,
    put(vars, #{}),
    put(this, C:set_val_internal(get(this),'sConfig',P_sConfig)),
    put(this, C:set_val_internal(get(this),'pConfig',P_pConfig)),
    put(this, C:set_val_internal(get(this),'policy',P_policy)),
     %% K8sService.abs:28--28
    put(this, C:set_val_internal(get(this),'lb',null)),
     %% K8sService.abs:29--29
    put(this, C:set_val_internal(get(this),'scaler',null)),
     %% K8sService.abs:30--30
    put(this, C:set_val_internal(get(this),'ep',null)),
    cog:task_is_blocked_for_gc(Cog, self(), get(task_info), get(this)),
    cog:add_task(Cog,active_object_task,null,O,[],#task_info{event=#event{type=schedule, local_id=run}, method= <<"run"/utf8>>,this=O,destiny=null},[O,DC| Stack]),
    cog:task_is_runnable(Cog,self()),
    task:wait_for_token(Cog,[O,DC| Stack]),
    gc:register_object(O),
    O.
%% --- Class has no recovery block

%% --- Methods

 %% K8sService.abs:32
 %% K8sService.abs:32
'm_run'(O=#object{oid=Oid,cog=Cog=#cog{ref=CogRef,dcobj=DC}},Stack)->
    C=(get(this))#state.class,
    put(vars, #{ 'this' => O }),
    try
         %% K8sService.abs:33--33
        put(this, C:set_val_internal(get(this), 'lb',object:new(cog:start(Cog,DC),class_K8sService_ServiceLoadBalancerObject,[C:get_val_internal(get(this), 'policy'),[]],Cog,[O,DC| Stack]))),
         %% K8sService.abs:34--34
        T_1 = (fun() -> case C:get_val_internal(get(this), 'policy') of
            null -> throw(dataNullPointerException);
            Callee=#object{oid=Oid,cog=Cog} ->
                %% self-call
                Vars=get(vars),
                Result=C:'m_setLb'(Callee,C:get_val_internal(get(this), 'lb'),[O,DC,Vars| Stack]),
                put(vars, Vars),
                Result;
            Callee=#object{oid=ObjRef,cog=Cog} ->
                %% cog-local call
                V_lb = C:get_val_internal(get(this), 'lb'),
                State=get(this),
                Vars=get(vars),
                cog:object_state_changed(Cog, O, State),
                put(this,cog:get_object_state(Callee#object.cog, Callee)),
                put(task_info,(get(task_info))#task_info{this=Callee}),
                T=object:get_class_from_state(get(this)), % it's the callee state already
                Result=T:'m_setLb'(Callee, V_lb,[O,DC,Vars,State| Stack]),
                cog:object_state_changed(Callee#object.cog, Callee, get(this)),
                put(task_info,(get(task_info))#task_info{this=O}),
                put(this, cog:get_object_state(Cog, O)),
                put(vars, Vars),
                Result;
            Callee ->
                %% remote call
                TempFuture = cog:create_task(Callee,'m_setLb',[C:get_val_internal(get(this), 'lb'),[]],#task_info{method= <<"setLb"/utf8>>},Cog, true),
                future:get_blocking(TempFuture, Cog, [O,DC| Stack])
        end end)(),
        T_1,
         %% K8sService.abs:35--35
        put(this, C:set_val_internal(get(this), 'ep',object:new(cog:start(Cog,DC),class_K8sService_ServiceEndpointObject,[C:get_val_internal(get(this), 'lb'),[]],Cog,[O,DC| Stack]))),
        dataUnit
        
    catch
        _:Exception:Stacktrace ->
            io:format(standard_error, "Uncaught ~s in method run and no recovery block in class definition, killing object ~s~n", [builtin:toString(Cog, Exception), builtin:toString(Cog, O)]),
            io:format(standard_error, "stacktrace: ~tp~n", [Stacktrace]),
            object:die(O, Exception), exit(Exception)
    end.
 %% K8sService.abs:38
 %% K8sService.abs:38
'm_deploy'(O=#object{oid=Oid,cog=Cog=#cog{ref=CogRef,dcobj=DC}},V_scheduler_0,Stack)->
    C=(get(this))#state.class,
    put(vars, #{ 'this' => O,
 'scheduler' => V_scheduler_0 }),
    try
         %% K8sService.abs:39--39
        put(this, C:set_val_internal(get(this), 'scaler',object:new(cog:start(Cog,DC),class_K8sService_ServiceAutoscalerObject,[maps:get('scheduler', get(vars)),C:get_val_internal(get(this), 'lb'),C:get_val_internal(get(this), 'sConfig'),C:get_val_internal(get(this), 'pConfig'),[]],Cog,[O,DC| Stack]))),
         %% K8sService.abs:40--40
        T_1 = (fun() -> case C:get_val_internal(get(this), 'scaler') of
            null -> throw(dataNullPointerException);
            Callee=#object{oid=Oid,cog=Cog} ->
                %% self-call
                Vars=get(vars),
                Result=C:'m_initialize'(Callee,[O,DC,Vars| Stack]),
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
                Result=T:'m_initialize'(Callee,[O,DC,Vars,State| Stack]),
                cog:object_state_changed(Callee#object.cog, Callee, get(this)),
                put(task_info,(get(task_info))#task_info{this=O}),
                put(this, cog:get_object_state(Cog, O)),
                put(vars, Vars),
                Result;
            Callee ->
                %% remote call
                TempFuture = cog:create_task(Callee,'m_initialize',[[]],#task_info{method= <<"initialize"/utf8>>},Cog, true),
                future:get_blocking(TempFuture, Cog, [O,DC| Stack])
        end end)(),
        T_1,
        dataUnit
        
    catch
        _:Exception:Stacktrace ->
            io:format(standard_error, "Uncaught ~s in method deploy and no recovery block in class definition, killing object ~s~n", [builtin:toString(Cog, Exception), builtin:toString(Cog, O)]),
            io:format(standard_error, "stacktrace: ~tp~n", [Stacktrace]),
            object:die(O, Exception), exit(Exception)
    end.
 %% K8sService.abs:43
 %% K8sService.abs:43
'm_getServiceEndpoint'(O=#object{oid=Oid,cog=Cog=#cog{ref=CogRef,dcobj=DC}},Stack)->
    C=(get(this))#state.class,
    put(vars, #{ 'this' => O }),
    try
         %% K8sService.abs:44--44
        C:get_val_internal(get(this), 'ep')
    catch
        _:Exception:Stacktrace ->
            io:format(standard_error, "Uncaught ~s in method getServiceEndpoint and no recovery block in class definition, killing object ~s~n", [builtin:toString(Cog, Exception), builtin:toString(Cog, O)]),
            io:format(standard_error, "stacktrace: ~tp~n", [Stacktrace]),
            object:die(O, Exception), exit(Exception)
    end.
 %% K8sService.abs:47
 %% K8sService.abs:47
'm_getConsumption'(O=#object{oid=Oid,cog=Cog=#cog{ref=CogRef,dcobj=DC}},Stack)->
    C=(get(this))#state.class,
    put(vars, #{ 'this' => O }),
    try
         %% K8sService.abs:48--48
        put(vars, (get(vars))#{'tmp81709688' => cog:create_task(C:get_val_internal(get(this), 'lb'),'m_getConsumptions',[[]],#task_info{method= <<"getConsumptions"/utf8>>, creation={dataTime,builtin:currentms(Cog)}, proc_deadline=dataInfDuration},Cog,true)}),
         %% K8sService.abs:48--48
        future:await(maps:get('tmp81709688', get(vars)), Cog, [O,DC| Stack]),
        ok,
         %% K8sService.abs:48--48
        put(vars, (get(vars))#{'cns' => future:get_blocking(maps:get('tmp81709688', get(vars)), Cog, [O,DC| Stack])}),
         %% K8sService.abs:49--49
        maps:get('cns', get(vars))
    catch
        _:Exception:Stacktrace ->
            io:format(standard_error, "Uncaught ~s in method getConsumption and no recovery block in class definition, killing object ~s~n", [builtin:toString(Cog, Exception), builtin:toString(Cog, O)]),
            io:format(standard_error, "stacktrace: ~tp~n", [Stacktrace]),
            object:die(O, Exception), exit(Exception)
    end.
 %% K8sService.abs:52
 %% K8sService.abs:52
'm_getPodsConsumptions'(O=#object{oid=Oid,cog=Cog=#cog{ref=CogRef,dcobj=DC}},Stack)->
    C=(get(this))#state.class,
    put(vars, #{ 'this' => O }),
    try
         %% K8sService.abs:54--54
        put(vars, (get(vars))#{'tmp1600512192' => cog:create_task(C:get_val_internal(get(this), 'lb'),'m_getPodsConsumptions',[[]],#task_info{method= <<"getPodsConsumptions"/utf8>>, creation={dataTime,builtin:currentms(Cog)}, proc_deadline=dataInfDuration},Cog,true)}),
         %% K8sService.abs:54--54
        future:await(maps:get('tmp1600512192', get(vars)), Cog, [O,DC| Stack]),
        ok,
         %% K8sService.abs:54--54
        put(vars, (get(vars))#{'list' => future:get_blocking(maps:get('tmp1600512192', get(vars)), Cog, [O,DC| Stack])}),
         %% K8sService.abs:55--55
        maps:get('list', get(vars))
    catch
        _:Exception:Stacktrace ->
            io:format(standard_error, "Uncaught ~s in method getPodsConsumptions and no recovery block in class definition, killing object ~s~n", [builtin:toString(Cog, Exception), builtin:toString(Cog, O)]),
            io:format(standard_error, "stacktrace: ~tp~n", [Stacktrace]),
            object:die(O, Exception), exit(Exception)
    end.
 %% K8sService.abs:58
 %% K8sService.abs:58
'm_getName'(O=#object{oid=Oid,cog=Cog=#cog{ref=CogRef,dcobj=DC}},Stack)->
    C=(get(this))#state.class,
    put(vars, #{ 'this' => O }),
    try
         %% K8sService.abs:59--59
        m_K8sUtil_funs:f_name(Cog,C:get_val_internal(get(this), 'sConfig'),[O,DC| Stack])
    catch
        _:Exception:Stacktrace ->
            io:format(standard_error, "Uncaught ~s in method getName and no recovery block in class definition, killing object ~s~n", [builtin:toString(Cog, Exception), builtin:toString(Cog, O)]),
            io:format(standard_error, "stacktrace: ~tp~n", [Stacktrace]),
            object:die(O, Exception), exit(Exception)
    end.
 %% K8sService.abs:62
 %% K8sService.abs:62
'm_getUpscaleThreshold'(O=#object{oid=Oid,cog=Cog=#cog{ref=CogRef,dcobj=DC}},Stack)->
    C=(get(this))#state.class,
    put(vars, #{ 'this' => O }),
    try
         %% K8sService.abs:63--63
        m_K8sUtil_funs:f_upscaleThreshold(Cog,C:get_val_internal(get(this), 'sConfig'),[O,DC| Stack])
    catch
        _:Exception:Stacktrace ->
            io:format(standard_error, "Uncaught ~s in method getUpscaleThreshold and no recovery block in class definition, killing object ~s~n", [builtin:toString(Cog, Exception), builtin:toString(Cog, O)]),
            io:format(standard_error, "stacktrace: ~tp~n", [Stacktrace]),
            object:die(O, Exception), exit(Exception)
    end.
