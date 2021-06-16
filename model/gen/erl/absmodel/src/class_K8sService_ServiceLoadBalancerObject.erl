-module(class_K8sService_ServiceLoadBalancerObject).
-include_lib("../include/abs_types.hrl").
-behaviour(object).
-export([get_val_internal/2,set_val_internal/3,init_internal/0,get_state_for_modelapi/1,implemented_interfaces/0,exported/0]).
-compile(export_all).

implemented_interfaces() -> [ <<"ServiceLoadBalancer">>, <<"Object">> ].

exported() -> #{  }.

%% --- Internal state and low-level accessors

-record(state,{'class'=class_K8sService_ServiceLoadBalancerObject,'policy'=null,'pods'=null,'activePods'=null}).
'init_internal'()->
    #state{}.

 %% K8sService.abs:283
'get_val_internal'(#state{'policy'=G},'policy')->
    G;
 %% K8sService.abs:285
'get_val_internal'(#state{'pods'=G},'pods')->
    G;
 %% K8sService.abs:287
'get_val_internal'(#state{'activePods'=G},'activePods')->
    G;
'get_val_internal'(_,_)->
    %% Invalid return value; handled by HTTP API when querying for non-existant field.
    %% Will never occur in generated code.
    none.

 %% K8sService.abs:283
'set_val_internal'(S,'policy',V)->
    S#state{'policy'=V};
 %% K8sService.abs:285
'set_val_internal'(S,'pods',V)->
    S#state{'pods'=V};
 %% K8sService.abs:287
'set_val_internal'(S,'activePods',V)->
    S#state{'activePods'=V}.

'get_state_for_modelapi'(S)->
    [
        { 'policy', S#state.'policy' }
        , { 'pods', S#state.'pods' }
        , { 'activePods', S#state.'activePods' }
    ].
%% --- Constructor: field initializers and init block

'init'(O=#object{oid=Oid,cog=Cog=#cog{ref=CogRef,dcobj=DC}},[P_policy,Stack])->
    C=(get(this))#state.class,
    put(vars, #{}),
    put(this, C:set_val_internal(get(this),'policy',P_policy)),
     %% K8sService.abs:285--285
    put(this, C:set_val_internal(get(this),'pods',m_ABS_StdLib_funs:f_list(Cog,[],[O,DC| Stack]))),
     %% K8sService.abs:287--287
    put(this, C:set_val_internal(get(this),'activePods',m_ABS_StdLib_funs:f_list(Cog,[],[O,DC| Stack]))),
    gc:register_object(O),
    O.
%% --- Class has no recovery block

%% --- Methods

 %% K8sService.abs:289
 %% K8sService.abs:289
'm_distributeRequest'(O=#object{oid=Oid,cog=Cog=#cog{ref=CogRef,dcobj=DC}},V_req_0,Stack)->
    C=(get(this))#state.class,
    put(vars, #{ 'this' => O,
 'req' => V_req_0 }),
    try
         %% K8sService.abs:291--291
        put(vars, (get(vars))#{'tmp1318272241' => cog:create_task(C:get_val_internal(get(this), 'policy'),'m_distributeRequest',[maps:get('req', get(vars)),C:get_val_internal(get(this), 'activePods'),[]],#task_info{method= <<"distributeRequest"/utf8>>, creation={dataTime,builtin:currentms(Cog)}, proc_deadline=dataInfDuration},Cog,true)}),
         %% K8sService.abs:291--291
        future:await(maps:get('tmp1318272241', get(vars)), Cog, [O,DC| Stack]),
        ok,
         %% K8sService.abs:291--291
        put(vars, (get(vars))#{'result' => future:get_blocking(maps:get('tmp1318272241', get(vars)), Cog, [O,DC| Stack])}),
         %% K8sService.abs:293--293
        maps:get('result', get(vars))
    catch
        _:Exception:Stacktrace ->
            io:format(standard_error, "Uncaught ~s in method distributeRequest and no recovery block in class definition, killing object ~s~n", [builtin:toString(Cog, Exception), builtin:toString(Cog, O)]),
            io:format(standard_error, "stacktrace: ~tp~n", [Stacktrace]),
            object:die(O, Exception), exit(Exception)
    end.
 %% K8sService.abs:296
 %% K8sService.abs:296
'm_addPod'(O=#object{oid=Oid,cog=Cog=#cog{ref=CogRef,dcobj=DC}},V_p_0,V_rm_0,Stack)->
    C=(get(this))#state.class,
    put(vars, #{ 'this' => O,
 'p' => V_p_0,
 'rm' => V_rm_0 }),
    try
         %% K8sService.abs:297--297
        put(this, C:set_val_internal(get(this), 'pods',m_ABS_StdLib_funs:f_appendright(Cog,C:get_val_internal(get(this), 'pods'),{ dataPair,maps:get('p', get(vars)),maps:get('rm', get(vars))},[O,DC| Stack]))),
         %% K8sService.abs:298--298
        put(this, C:set_val_internal(get(this), 'activePods',m_ABS_StdLib_funs:f_appendright(Cog,C:get_val_internal(get(this), 'activePods'),maps:get('p', get(vars)),[O,DC| Stack]))),
        dataUnit
        
    catch
        _:Exception:Stacktrace ->
            io:format(standard_error, "Uncaught ~s in method addPod and no recovery block in class definition, killing object ~s~n", [builtin:toString(Cog, Exception), builtin:toString(Cog, O)]),
            io:format(standard_error, "stacktrace: ~tp~n", [Stacktrace]),
            object:die(O, Exception), exit(Exception)
    end.
 %% K8sService.abs:301
 %% K8sService.abs:301
'm_removePod'(O=#object{oid=Oid,cog=Cog=#cog{ref=CogRef,dcobj=DC}},V_p_0,Stack)->
    C=(get(this))#state.class,
    put(vars, #{ 'this' => O,
 'p' => V_p_0 }),
    try
         %% K8sService.abs:302--302
        put(vars, (get(vars))#{'pair' => { dataPair,null,null}}),
         %% K8sService.abs:304--308
        put(vars, (get(vars))#{'tmp448070390' => C:get_val_internal(get(this), 'pods')}),
         %% K8sService.abs:304--308
        []=(fun Loop ([])->
            case not (m_ABS_StdLib_funs:f_isEmpty(Cog,maps:get('tmp448070390', get(vars)),[O,DC| Stack])) of
            false -> [];
            true -> receive
                    {stop_world, CogRef} ->
                        cog:task_is_blocked_for_gc(Cog, self(), get(task_info), get(this)),
                        cog:task_is_runnable(Cog,self()),
                        task:wait_for_token(Cog,[O,DC| Stack])
                    after 0 -> ok
                end,
                 %% K8sService.abs:304--308
                put(vars, (get(vars))#{'pr' => m_ABS_StdLib_funs:f_head(Cog,maps:get('tmp448070390', get(vars)),[O,DC| Stack])}),
                 %% K8sService.abs:304--308
                put(vars, (get(vars))#{'tmp448070390' := m_ABS_StdLib_funs:f_tail(Cog,maps:get('tmp448070390', get(vars)),[O,DC| Stack])}),
                 %% K8sService.abs:305--305
                case cmp:eq(m_ABS_StdLib_funs:f_fst(Cog,maps:get('pr', get(vars)),[O,DC| Stack]),maps:get('p', get(vars))) of
                    true ->  %% K8sService.abs:306--306
                    put(vars, (get(vars))#{'pair' := maps:get('pr', get(vars))});
                    false ->                 ok
                end,
            Loop([])  end end)
        ([]),
         %% K8sService.abs:309--309
        put(this, C:set_val_internal(get(this), 'activePods',m_ABS_StdLib_funs:f_without(Cog,C:get_val_internal(get(this), 'activePods'),maps:get('p', get(vars)),[O,DC| Stack]))),
         %% K8sService.abs:311--311
        put(vars, (get(vars))#{'tmp1922735165' => cog:create_task(maps:get('p', get(vars)),'m_isIdle',[[]],#task_info{method= <<"isIdle"/utf8>>, creation={dataTime,builtin:currentms(Cog)}, proc_deadline=dataInfDuration},Cog,true)}),
         %% K8sService.abs:311--311
        future:await(maps:get('tmp1922735165', get(vars)), Cog, [O,DC| Stack]),
        ok,
         %% K8sService.abs:312--312
        put(this, C:set_val_internal(get(this), 'pods',m_ABS_StdLib_funs:f_without(Cog,C:get_val_internal(get(this), 'pods'),maps:get('pair', get(vars)),[O,DC| Stack]))),
        dataUnit
        
    catch
        _:Exception:Stacktrace ->
            io:format(standard_error, "Uncaught ~s in method removePod and no recovery block in class definition, killing object ~s~n", [builtin:toString(Cog, Exception), builtin:toString(Cog, O)]),
            io:format(standard_error, "stacktrace: ~tp~n", [Stacktrace]),
            object:die(O, Exception), exit(Exception)
    end.
 %% K8sService.abs:316
 %% K8sService.abs:316
'm_getPods'(O=#object{oid=Oid,cog=Cog=#cog{ref=CogRef,dcobj=DC}},Stack)->
    C=(get(this))#state.class,
    put(vars, #{ 'this' => O }),
    try
         %% K8sService.abs:317--317
        put(vars, (get(vars))#{'result' => m_ABS_StdLib_funs:f_list(Cog,[],[O,DC| Stack])}),
         %% K8sService.abs:319--321
        put(vars, (get(vars))#{'tmp713961699' => C:get_val_internal(get(this), 'pods')}),
         %% K8sService.abs:319--321
        []=(fun Loop ([])->
            case not (m_ABS_StdLib_funs:f_isEmpty(Cog,maps:get('tmp713961699', get(vars)),[O,DC| Stack])) of
            false -> [];
            true -> receive
                    {stop_world, CogRef} ->
                        cog:task_is_blocked_for_gc(Cog, self(), get(task_info), get(this)),
                        cog:task_is_runnable(Cog,self()),
                        task:wait_for_token(Cog,[O,DC| Stack])
                    after 0 -> ok
                end,
                 %% K8sService.abs:319--321
                put(vars, (get(vars))#{'p' => m_ABS_StdLib_funs:f_head(Cog,maps:get('tmp713961699', get(vars)),[O,DC| Stack])}),
                 %% K8sService.abs:319--321
                put(vars, (get(vars))#{'tmp713961699' := m_ABS_StdLib_funs:f_tail(Cog,maps:get('tmp713961699', get(vars)),[O,DC| Stack])}),
                 %% K8sService.abs:320--320
                put(vars, (get(vars))#{'result' := m_ABS_StdLib_funs:f_appendright(Cog,maps:get('result', get(vars)),maps:get('p', get(vars)),[O,DC| Stack])}),
            Loop([])  end end)
        ([]),
         %% K8sService.abs:323--323
        maps:get('result', get(vars))
    catch
        _:Exception:Stacktrace ->
            io:format(standard_error, "Uncaught ~s in method getPods and no recovery block in class definition, killing object ~s~n", [builtin:toString(Cog, Exception), builtin:toString(Cog, O)]),
            io:format(standard_error, "stacktrace: ~tp~n", [Stacktrace]),
            object:die(O, Exception), exit(Exception)
    end.
 %% K8sService.abs:326
 %% K8sService.abs:326
'm_getActivePods'(O=#object{oid=Oid,cog=Cog=#cog{ref=CogRef,dcobj=DC}},Stack)->
    C=(get(this))#state.class,
    put(vars, #{ 'this' => O }),
    try
         %% K8sService.abs:328--328
        C:get_val_internal(get(this), 'activePods')
    catch
        _:Exception:Stacktrace ->
            io:format(standard_error, "Uncaught ~s in method getActivePods and no recovery block in class definition, killing object ~s~n", [builtin:toString(Cog, Exception), builtin:toString(Cog, O)]),
            io:format(standard_error, "stacktrace: ~tp~n", [Stacktrace]),
            object:die(O, Exception), exit(Exception)
    end.
 %% K8sService.abs:331
 %% K8sService.abs:331
'm_setActivePods'(O=#object{oid=Oid,cog=Cog=#cog{ref=CogRef,dcobj=DC}},V_aPods_0,Stack)->
    C=(get(this))#state.class,
    put(vars, #{ 'this' => O,
 'aPods' => V_aPods_0 }),
    try
         %% K8sService.abs:332--332
        put(this, C:set_val_internal(get(this), 'activePods',maps:get('aPods', get(vars)))),
        dataUnit
        
    catch
        _:Exception:Stacktrace ->
            io:format(standard_error, "Uncaught ~s in method setActivePods and no recovery block in class definition, killing object ~s~n", [builtin:toString(Cog, Exception), builtin:toString(Cog, O)]),
            io:format(standard_error, "stacktrace: ~tp~n", [Stacktrace]),
            object:die(O, Exception), exit(Exception)
    end.
 %% K8sService.abs:335
 %% K8sService.abs:335
'm_getConsumptions'(O=#object{oid=Oid,cog=Cog=#cog{ref=CogRef,dcobj=DC}},Stack)->
    C=(get(this))#state.class,
    put(vars, #{ 'this' => O }),
    try
         %% K8sService.abs:336--336
        put(vars, (get(vars))#{'cpu' => 0}),
         %% K8sService.abs:337--337
        put(vars, (get(vars))#{'memory' => 0}),
         %% K8sService.abs:338--338
        put(vars, (get(vars))#{'ratio' => 0}),
         %% K8sService.abs:340--350
        put(vars, (get(vars))#{'tmp835020577' => C:get_val_internal(get(this), 'pods')}),
         %% K8sService.abs:340--350
        []=(fun Loop ([])->
            case not (m_ABS_StdLib_funs:f_isEmpty(Cog,maps:get('tmp835020577', get(vars)),[O,DC| Stack])) of
            false -> [];
            true -> receive
                    {stop_world, CogRef} ->
                        cog:task_is_blocked_for_gc(Cog, self(), get(task_info), get(this)),
                        cog:task_is_runnable(Cog,self()),
                        task:wait_for_token(Cog,[O,DC| Stack])
                    after 0 -> ok
                end,
                 %% K8sService.abs:340--350
                put(vars, (get(vars))#{'p' => m_ABS_StdLib_funs:f_head(Cog,maps:get('tmp835020577', get(vars)),[O,DC| Stack])}),
                 %% K8sService.abs:340--350
                put(vars, (get(vars))#{'tmp835020577' := m_ABS_StdLib_funs:f_tail(Cog,maps:get('tmp835020577', get(vars)),[O,DC| Stack])}),
                 %% K8sService.abs:341--341
                put(vars, (get(vars))#{'rm' => m_ABS_StdLib_funs:f_snd(Cog,maps:get('p', get(vars)),[O,DC| Stack])}),
                 %% K8sService.abs:343--343
                put(vars, (get(vars))#{'tmp1464018925' => cog:create_task(maps:get('rm', get(vars)),'m_cpuConsumption',[[]],#task_info{method= <<"cpuConsumption"/utf8>>, creation={dataTime,builtin:currentms(Cog)}, proc_deadline=dataInfDuration},Cog,true)}),
                 %% K8sService.abs:343--343
                future:await(maps:get('tmp1464018925', get(vars)), Cog, [O,DC| Stack]),
                ok,
                 %% K8sService.abs:343--343
                put(vars, (get(vars))#{'c' => future:get_blocking(maps:get('tmp1464018925', get(vars)), Cog, [O,DC| Stack])}),
                 %% K8sService.abs:344--344
                put(vars, (get(vars))#{'tmp1283403739' => cog:create_task(maps:get('rm', get(vars)),'m_memoryConsumption',[[]],#task_info{method= <<"memoryConsumption"/utf8>>, creation={dataTime,builtin:currentms(Cog)}, proc_deadline=dataInfDuration},Cog,true)}),
                 %% K8sService.abs:344--344
                future:await(maps:get('tmp1283403739', get(vars)), Cog, [O,DC| Stack]),
                ok,
                 %% K8sService.abs:344--344
                put(vars, (get(vars))#{'m' => future:get_blocking(maps:get('tmp1283403739', get(vars)), Cog, [O,DC| Stack])}),
                 %% K8sService.abs:345--345
                put(vars, (get(vars))#{'tmp459077137' => cog:create_task(maps:get('rm', get(vars)),'m_cpuConsumptionRatio',[[]],#task_info{method= <<"cpuConsumptionRatio"/utf8>>, creation={dataTime,builtin:currentms(Cog)}, proc_deadline=dataInfDuration},Cog,true)}),
                 %% K8sService.abs:345--345
                future:await(maps:get('tmp459077137', get(vars)), Cog, [O,DC| Stack]),
                ok,
                 %% K8sService.abs:345--345
                put(vars, (get(vars))#{'r' => future:get_blocking(maps:get('tmp459077137', get(vars)), Cog, [O,DC| Stack])}),
                 %% K8sService.abs:347--347
                put(vars, (get(vars))#{'cpu' := ( rationals:add(maps:get('cpu', get(vars)),maps:get('c', get(vars)))) }),
                 %% K8sService.abs:348--348
                put(vars, (get(vars))#{'memory' := ( rationals:add(maps:get('memory', get(vars)),maps:get('m', get(vars)))) }),
                 %% K8sService.abs:349--349
                put(vars, (get(vars))#{'ratio' := ( rationals:add(maps:get('ratio', get(vars)),maps:get('r', get(vars)))) }),
            Loop([])  end end)
        ([]),
         %% K8sService.abs:352--352
        put(vars, (get(vars))#{'ratio' :=  rationals:rdiv(maps:get('ratio', get(vars)),m_ABS_StdLib_funs:f_length(Cog,C:get_val_internal(get(this), 'pods'),[O,DC| Stack])) }),
         %% K8sService.abs:354--354
        { dataServiceState,maps:get('cpu', get(vars)),maps:get('memory', get(vars)),maps:get('ratio', get(vars))}
    catch
        _:Exception:Stacktrace ->
            io:format(standard_error, "Uncaught ~s in method getConsumptions and no recovery block in class definition, killing object ~s~n", [builtin:toString(Cog, Exception), builtin:toString(Cog, O)]),
            io:format(standard_error, "stacktrace: ~tp~n", [Stacktrace]),
            object:die(O, Exception), exit(Exception)
    end.
 %% K8sService.abs:357
 %% K8sService.abs:357
'm_getPodsConsumptions'(O=#object{oid=Oid,cog=Cog=#cog{ref=CogRef,dcobj=DC}},Stack)->
    C=(get(this))#state.class,
    put(vars, #{ 'this' => O }),
    try
         %% K8sService.abs:358--358
        put(vars, (get(vars))#{'stateList' => m_ABS_StdLib_funs:f_list(Cog,[],[O,DC| Stack])}),
         %% K8sService.abs:360--364
        put(vars, (get(vars))#{'tmp1289035342' => C:get_val_internal(get(this), 'pods')}),
         %% K8sService.abs:360--364
        []=(fun Loop ([])->
            case not (m_ABS_StdLib_funs:f_isEmpty(Cog,maps:get('tmp1289035342', get(vars)),[O,DC| Stack])) of
            false -> [];
            true -> receive
                    {stop_world, CogRef} ->
                        cog:task_is_blocked_for_gc(Cog, self(), get(task_info), get(this)),
                        cog:task_is_runnable(Cog,self()),
                        task:wait_for_token(Cog,[O,DC| Stack])
                    after 0 -> ok
                end,
                 %% K8sService.abs:360--364
                put(vars, (get(vars))#{'p' => m_ABS_StdLib_funs:f_head(Cog,maps:get('tmp1289035342', get(vars)),[O,DC| Stack])}),
                 %% K8sService.abs:360--364
                put(vars, (get(vars))#{'tmp1289035342' := m_ABS_StdLib_funs:f_tail(Cog,maps:get('tmp1289035342', get(vars)),[O,DC| Stack])}),
                 %% K8sService.abs:361--361
                put(vars, (get(vars))#{'rm' => m_ABS_StdLib_funs:f_snd(Cog,maps:get('p', get(vars)),[O,DC| Stack])}),
                 %% K8sService.abs:362--362
                put(vars, (get(vars))#{'tmp1023535667' => cog:create_task(maps:get('rm', get(vars)),'m_getPodState',[[]],#task_info{method= <<"getPodState"/utf8>>, creation={dataTime,builtin:currentms(Cog)}, proc_deadline=dataInfDuration},Cog,true)}),
                 %% K8sService.abs:362--362
                future:await(maps:get('tmp1023535667', get(vars)), Cog, [O,DC| Stack]),
                ok,
                 %% K8sService.abs:362--362
                put(vars, (get(vars))#{'ps' => future:get_blocking(maps:get('tmp1023535667', get(vars)), Cog, [O,DC| Stack])}),
                 %% K8sService.abs:363--363
                put(vars, (get(vars))#{'stateList' := m_ABS_StdLib_funs:f_appendright(Cog,maps:get('stateList', get(vars)),maps:get('ps', get(vars)),[O,DC| Stack])}),
            Loop([])  end end)
        ([]),
         %% K8sService.abs:366--366
        maps:get('stateList', get(vars))
    catch
        _:Exception:Stacktrace ->
            io:format(standard_error, "Uncaught ~s in method getPodsConsumptions and no recovery block in class definition, killing object ~s~n", [builtin:toString(Cog, Exception), builtin:toString(Cog, O)]),
            io:format(standard_error, "stacktrace: ~tp~n", [Stacktrace]),
            object:die(O, Exception), exit(Exception)
    end.
