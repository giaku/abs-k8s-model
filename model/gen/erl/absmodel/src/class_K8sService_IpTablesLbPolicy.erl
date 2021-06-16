-module(class_K8sService_IpTablesLbPolicy).
-include_lib("../include/abs_types.hrl").
-behaviour(object).
-export([get_val_internal/2,set_val_internal/3,init_internal/0,get_state_for_modelapi/1,implemented_interfaces/0,exported/0]).
-compile(export_all).

implemented_interfaces() -> [ <<"ServiceLoadBalancerPolicy">>, <<"Object">> ].

exported() -> #{  }.

%% --- Internal state and low-level accessors

-record(state,{'class'=class_K8sService_IpTablesLbPolicy,'cycle'=null,'podCpuLimit'=null,'lb'=null,'pods'=null}).
'init_internal'()->
    #state{}.

 %% K8sService.abs:694
'get_val_internal'(#state{'cycle'=G},'cycle')->
    G;
 %% K8sService.abs:694
'get_val_internal'(#state{'podCpuLimit'=G},'podCpuLimit')->
    G;
 %% K8sService.abs:695
'get_val_internal'(#state{'lb'=G},'lb')->
    G;
 %% K8sService.abs:696
'get_val_internal'(#state{'pods'=G},'pods')->
    G;
'get_val_internal'(_,_)->
    %% Invalid return value; handled by HTTP API when querying for non-existant field.
    %% Will never occur in generated code.
    none.

 %% K8sService.abs:694
'set_val_internal'(S,'cycle',V)->
    S#state{'cycle'=V};
 %% K8sService.abs:694
'set_val_internal'(S,'podCpuLimit',V)->
    S#state{'podCpuLimit'=V};
 %% K8sService.abs:695
'set_val_internal'(S,'lb',V)->
    S#state{'lb'=V};
 %% K8sService.abs:696
'set_val_internal'(S,'pods',V)->
    S#state{'pods'=V}.

'get_state_for_modelapi'(S)->
    [
        { 'cycle', S#state.'cycle' }
        , { 'podCpuLimit', S#state.'podCpuLimit' }
        , { 'lb', S#state.'lb' }
        , { 'pods', S#state.'pods' }
    ].
%% --- Constructor: field initializers and init block

'init'(O=#object{oid=Oid,cog=Cog=#cog{ref=CogRef,dcobj=DC}},[P_cycle,P_podCpuLimit,Stack])->
    C=(get(this))#state.class,
    put(vars, #{}),
    put(this, C:set_val_internal(get(this),'cycle',P_cycle)),
    put(this, C:set_val_internal(get(this),'podCpuLimit',P_podCpuLimit)),
     %% K8sService.abs:695--695
     %% K8sService.abs:696--696
    put(this, C:set_val_internal(get(this),'pods',m_ABS_StdLib_funs:f_map(Cog,[],[O,DC| Stack]))),
    gc:register_object(O),
    O.
%% --- Class has no recovery block

%% --- Methods

 %% K8sService.abs:698
 %% K8sService.abs:698
'm_distributeRequest'(O=#object{oid=Oid,cog=Cog=#cog{ref=CogRef,dcobj=DC}},V_req_0,V_activePods_0,Stack)->
    C=(get(this))#state.class,
    put(vars, #{ 'this' => O,
 'req' => V_req_0,
 'activePods' => V_activePods_0 }),
    try
         %% K8sService.abs:699--699
        put(vars, (get(vars))#{'result' => m_ABS_StdLib_funs:f_map(Cog,[],[O,DC| Stack])}),
         %% K8sService.abs:700--700
        put(vars, (get(vars))#{'nPods' => m_ABS_StdLib_funs:f_length(Cog,maps:get('activePods', get(vars)),[O,DC| Stack])}),
         %% K8sService.abs:701--701
        put(vars, (get(vars))#{'batchSize' => m_K8sUtil_funs:f_batchSize(Cog,maps:get('req', get(vars)),[O,DC| Stack])}),
         %% K8sService.abs:702--702
        put(vars, (get(vars))#{'reqCost' => m_K8sUtil_funs:f_requestCost(Cog,maps:get('req', get(vars)),[O,DC| Stack])}),
         %% K8sService.abs:703--703
        put(vars, (get(vars))#{'costPerRequest' =>  rationals:rdiv(maps:get('reqCost', get(vars)),maps:get('batchSize', get(vars))) }),
         %% K8sService.abs:704--704
        put(vars, (get(vars))#{'podIndex' => 0}),
         %% K8sService.abs:705--705
        put(vars, (get(vars))#{'round' => 1}),
         %% K8sService.abs:707--707
        []=(fun Loop ([])->
            case cmp:gt(maps:get('batchSize', get(vars)),0) of
            false -> [];
            true -> receive
                    {stop_world, CogRef} ->
                        cog:task_is_blocked_for_gc(Cog, self(), get(task_info), get(this)),
                        cog:task_is_runnable(Cog,self()),
                        task:wait_for_token(Cog,[O,DC| Stack])
                    after 0 -> ok
                end,
                 %% K8sService.abs:709--709
                put(vars, (get(vars))#{'p' => m_ABS_StdLib_funs:f_nth(Cog,maps:get('activePods', get(vars)),maps:get('podIndex', get(vars)),[O,DC| Stack])}),
                 %% K8sService.abs:710--710
                put(vars, (get(vars))#{'pLoad' => m_ABS_StdLib_funs:f_lookupDefault(Cog,C:get_val_internal(get(this), 'pods'),maps:get('p', get(vars)),0,[O,DC| Stack])}),
                 %% K8sService.abs:711--711
                put(vars, (get(vars))#{'cpuToLimit' => ( rationals:sub(( rationals:mul(maps:get('round', get(vars)),C:get_val_internal(get(this), 'podCpuLimit'))) ,maps:get('pLoad', get(vars)))) }),
                 %% K8sService.abs:714--714
                case cmp:gt(maps:get('cpuToLimit', get(vars)),0) of
                    true ->  %% K8sService.abs:715--715
                    put(vars, (get(vars))#{'toAssign' => 0}),
                     %% K8sService.abs:716--716
                    case cmp:lt(maps:get('cpuToLimit', get(vars)),maps:get('reqCost', get(vars))) of
                        true ->  %% K8sService.abs:717--717
                        put(vars, (get(vars))#{'toAssign' :=  rationals:rdiv(maps:get('cpuToLimit', get(vars)),maps:get('costPerRequest', get(vars))) });
                        false ->                      %% K8sService.abs:719--719
                    put(vars, (get(vars))#{'toAssign' :=  rationals:rdiv(maps:get('reqCost', get(vars)),maps:get('costPerRequest', get(vars))) })
                    end,
                     %% K8sService.abs:721--721
                    put(vars, (get(vars))#{'reqToAssign' => builtin:ceil(Cog,builtin:float(Cog,maps:get('toAssign', get(vars))))}),
                     %% K8sService.abs:724--724
                    put(vars, (get(vars))#{'currentValue' => m_ABS_StdLib_funs:f_lookupDefault(Cog,maps:get('result', get(vars)),maps:get('p', get(vars)),-1,[O,DC| Stack])}),
                     %% K8sService.abs:725--725
                    case (not cmp:eq(maps:get('currentValue', get(vars)),-1)) of
                        true ->  %% K8sService.abs:726--726
                        put(vars, (get(vars))#{'currentValue' := (maps:get('currentValue', get(vars)) + maps:get('reqToAssign', get(vars))) }),
                         %% K8sService.abs:727--727
                        put(vars, (get(vars))#{'result' := m_ABS_StdLib_funs:f_put(Cog,maps:get('result', get(vars)),maps:get('p', get(vars)),maps:get('currentValue', get(vars)),[O,DC| Stack])});
                        false ->                      %% K8sService.abs:729--729
                    put(vars, (get(vars))#{'result' := m_ABS_StdLib_funs:f_put(Cog,maps:get('result', get(vars)),maps:get('p', get(vars)),maps:get('reqToAssign', get(vars)),[O,DC| Stack])})
                    end,
                     %% K8sService.abs:733--733
                    put(vars, (get(vars))#{'assignedCost' => ( rationals:mul(maps:get('reqToAssign', get(vars)),maps:get('costPerRequest', get(vars)))) }),
                     %% K8sService.abs:735--735
                    put(vars, (get(vars))#{'pLoad' := m_ABS_StdLib_funs:f_lookupDefault(Cog,C:get_val_internal(get(this), 'pods'),maps:get('p', get(vars)),0,[O,DC| Stack])}),
                     %% K8sService.abs:736--736
                    put(this, C:set_val_internal(get(this), 'pods',m_ABS_StdLib_funs:f_put(Cog,C:get_val_internal(get(this), 'pods'),maps:get('p', get(vars)),( rationals:add(maps:get('pLoad', get(vars)),maps:get('assignedCost', get(vars)))) ,[O,DC| Stack]))),
                     %% K8sService.abs:738--738
                    put(vars, (get(vars))#{'batchSize' := (maps:get('batchSize', get(vars)) - maps:get('reqToAssign', get(vars))) }),
                     %% K8sService.abs:739--739
                    put(vars, (get(vars))#{'reqCost' := ( rationals:sub(maps:get('reqCost', get(vars)),maps:get('assignedCost', get(vars)))) });
                    false ->                 ok
                end,
                 %% K8sService.abs:742--742
                put(vars, (get(vars))#{'podIndex' := (maps:get('podIndex', get(vars)) + 1) }),
                 %% K8sService.abs:743--743
                case cmp:ge(maps:get('podIndex', get(vars)),maps:get('nPods', get(vars))) of
                    true ->  %% K8sService.abs:744--744
                    put(vars, (get(vars))#{'podIndex' := 0}),
                     %% K8sService.abs:745--745
                    put(vars, (get(vars))#{'round' := (maps:get('round', get(vars)) + 1) });
                    false ->                 ok
                end,
            Loop([])  end end)
        ([]),
         %% K8sService.abs:748--748
        maps:get('result', get(vars))
    catch
        _:Exception:Stacktrace ->
            io:format(standard_error, "Uncaught ~s in method distributeRequest and no recovery block in class definition, killing object ~s~n", [builtin:toString(Cog, Exception), builtin:toString(Cog, O)]),
            io:format(standard_error, "stacktrace: ~tp~n", [Stacktrace]),
            object:die(O, Exception), exit(Exception)
    end.
 %% K8sService.abs:751
 %% K8sService.abs:751
'm_refreshPods'(O=#object{oid=Oid,cog=Cog=#cog{ref=CogRef,dcobj=DC}},Stack)->
    C=(get(this))#state.class,
    put(vars, #{ 'this' => O }),
    try
         %% K8sService.abs:752--752
        put(vars, (get(vars))#{'lbPodsFut' => cog:create_task(C:get_val_internal(get(this), 'lb'),'m_getPods',[[]],#task_info{method= <<"getPods"/utf8>>, creation={dataTime,builtin:currentms(Cog)}, proc_deadline=dataInfDuration},Cog,true)}),
         %% K8sService.abs:753--753
        put(vars, (get(vars))#{'lbPods' => future:get_blocking(maps:get('lbPodsFut', get(vars)), Cog, [O,DC| Stack])}),
         %% K8sService.abs:755--768
        put(vars, (get(vars))#{'tmp291143249' => maps:get('lbPods', get(vars))}),
         %% K8sService.abs:755--768
        []=(fun Loop ([])->
            case not (m_ABS_StdLib_funs:f_isEmpty(Cog,maps:get('tmp291143249', get(vars)),[O,DC| Stack])) of
            false -> [];
            true -> receive
                    {stop_world, CogRef} ->
                        cog:task_is_blocked_for_gc(Cog, self(), get(task_info), get(this)),
                        cog:task_is_runnable(Cog,self()),
                        task:wait_for_token(Cog,[O,DC| Stack])
                    after 0 -> ok
                end,
                 %% K8sService.abs:755--768
                put(vars, (get(vars))#{'p' => m_ABS_StdLib_funs:f_head(Cog,maps:get('tmp291143249', get(vars)),[O,DC| Stack])}),
                 %% K8sService.abs:755--768
                put(vars, (get(vars))#{'tmp291143249' := m_ABS_StdLib_funs:f_tail(Cog,maps:get('tmp291143249', get(vars)),[O,DC| Stack])}),
                 %% K8sService.abs:756--756
                put(vars, (get(vars))#{'rm' => m_ABS_StdLib_funs:f_snd(Cog,maps:get('p', get(vars)),[O,DC| Stack])}),
                 %% K8sService.abs:757--757
                put(vars, (get(vars))#{'cpuConsumptionFut' => cog:create_task(maps:get('rm', get(vars)),'m_cpuConsumption',[[]],#task_info{method= <<"cpuConsumption"/utf8>>, creation={dataTime,builtin:currentms(Cog)}, proc_deadline=dataInfDuration},Cog,true)}),
                 %% K8sService.abs:758--758
                put(vars, (get(vars))#{'cpuConsumption' => future:get_blocking(maps:get('cpuConsumptionFut', get(vars)), Cog, [O,DC| Stack])}),
                 %% K8sService.abs:759--759
                put(vars, (get(vars))#{'newValue' => 0}),
                 %% K8sService.abs:761--761
                put(vars, (get(vars))#{'mapLoad' => m_ABS_StdLib_funs:f_lookupDefault(Cog,C:get_val_internal(get(this), 'pods'),m_ABS_StdLib_funs:f_fst(Cog,maps:get('p', get(vars)),[O,DC| Stack]),0,[O,DC| Stack])}),
                 %% K8sService.abs:762--762
                put(vars, (get(vars))#{'newValue' := ( rationals:sub(maps:get('mapLoad', get(vars)),maps:get('cpuConsumption', get(vars)))) }),
                 %% K8sService.abs:763--763
                case cmp:lt(maps:get('newValue', get(vars)),0) of
                    true ->  %% K8sService.abs:764--764
                    put(vars, (get(vars))#{'newValue' := 0});
                    false ->                 ok
                end,
                 %% K8sService.abs:767--767
                put(this, C:set_val_internal(get(this), 'pods',m_ABS_StdLib_funs:f_put(Cog,C:get_val_internal(get(this), 'pods'),m_ABS_StdLib_funs:f_fst(Cog,maps:get('p', get(vars)),[O,DC| Stack]),maps:get('newValue', get(vars)),[O,DC| Stack]))),
            Loop([])  end end)
        ([]),
         %% K8sService.abs:770--770
        cog:suspend_current_task_for_duration(Cog,C:get_val_internal(get(this), 'cycle'),C:get_val_internal(get(this), 'cycle'),[O,DC| Stack]),
        ok,
         %% K8sService.abs:772--772
        T_1 = (fun() -> case O of
            null -> throw(dataNullPointerException);
            Callee=#object{oid=Oid,cog=Cog} ->
                %% self-call
                Vars=get(vars),
                Result=C:'m_refreshPods'(Callee,[O,DC,Vars| Stack]),
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
                Result=T:'m_refreshPods'(Callee,[O,DC,Vars,State| Stack]),
                cog:object_state_changed(Callee#object.cog, Callee, get(this)),
                put(task_info,(get(task_info))#task_info{this=O}),
                put(this, cog:get_object_state(Cog, O)),
                put(vars, Vars),
                Result;
            Callee ->
                %% remote call
                TempFuture = cog:create_task(Callee,'m_refreshPods',[[]],#task_info{method= <<"refreshPods"/utf8>>},Cog, true),
                future:get_blocking(TempFuture, Cog, [O,DC| Stack])
        end end)(),
        T_1,
        dataUnit
        
    catch
        _:Exception:Stacktrace ->
            io:format(standard_error, "Uncaught ~s in method refreshPods and no recovery block in class definition, killing object ~s~n", [builtin:toString(Cog, Exception), builtin:toString(Cog, O)]),
            io:format(standard_error, "stacktrace: ~tp~n", [Stacktrace]),
            object:die(O, Exception), exit(Exception)
    end.
 %% K8sService.abs:775
 %% K8sService.abs:775
'm_setLb'(O=#object{oid=Oid,cog=Cog=#cog{ref=CogRef,dcobj=DC}},V_lb_0,Stack)->
    C=(get(this))#state.class,
    put(vars, #{ 'this' => O,
 'lb' => V_lb_0 }),
    try
         %% K8sService.abs:776--776
        put(this, C:set_val_internal(get(this), 'lb',maps:get('lb', get(vars)))),
         %% K8sService.abs:777--777
        T_1 = cog:create_task(O,'m_refreshPods',[[]],#task_info{method= <<"refreshPods"/utf8>>, creation={dataTime,builtin:currentms(Cog)}, proc_deadline=dataInfDuration},Cog,false),
        T_1,
        dataUnit
        
    catch
        _:Exception:Stacktrace ->
            io:format(standard_error, "Uncaught ~s in method setLb and no recovery block in class definition, killing object ~s~n", [builtin:toString(Cog, Exception), builtin:toString(Cog, O)]),
            io:format(standard_error, "stacktrace: ~tp~n", [Stacktrace]),
            object:die(O, Exception), exit(Exception)
    end.
