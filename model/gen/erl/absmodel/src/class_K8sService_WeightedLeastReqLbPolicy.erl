-module(class_K8sService_WeightedLeastReqLbPolicy).
-include_lib("../include/abs_types.hrl").
-behaviour(object).
-export([get_val_internal/2,set_val_internal/3,init_internal/0,get_state_for_modelapi/1,implemented_interfaces/0,exported/0]).
-compile(export_all).

implemented_interfaces() -> [ <<"ServiceLoadBalancerPolicy">>, <<"Object">> ].

exported() -> #{  }.

%% --- Internal state and low-level accessors

-record(state,{'class'=class_K8sService_WeightedLeastReqLbPolicy,'cycle'=null,'lb'=null,'pods'=null}).
'init_internal'()->
    #state{}.

 %% K8sService.abs:621
'get_val_internal'(#state{'cycle'=G},'cycle')->
    G;
 %% K8sService.abs:622
'get_val_internal'(#state{'lb'=G},'lb')->
    G;
 %% K8sService.abs:623
'get_val_internal'(#state{'pods'=G},'pods')->
    G;
'get_val_internal'(_,_)->
    %% Invalid return value; handled by HTTP API when querying for non-existant field.
    %% Will never occur in generated code.
    none.

 %% K8sService.abs:621
'set_val_internal'(S,'cycle',V)->
    S#state{'cycle'=V};
 %% K8sService.abs:622
'set_val_internal'(S,'lb',V)->
    S#state{'lb'=V};
 %% K8sService.abs:623
'set_val_internal'(S,'pods',V)->
    S#state{'pods'=V}.

'get_state_for_modelapi'(S)->
    [
        { 'cycle', S#state.'cycle' }
        , { 'lb', S#state.'lb' }
        , { 'pods', S#state.'pods' }
    ].
%% --- Constructor: field initializers and init block

'init'(O=#object{oid=Oid,cog=Cog=#cog{ref=CogRef,dcobj=DC}},[P_cycle,Stack])->
    C=(get(this))#state.class,
    put(vars, #{}),
    put(this, C:set_val_internal(get(this),'cycle',P_cycle)),
     %% K8sService.abs:622--622
     %% K8sService.abs:623--623
    put(this, C:set_val_internal(get(this),'pods',m_ABS_StdLib_funs:f_map(Cog,[],[O,DC| Stack]))),
    gc:register_object(O),
    O.
%% --- Class has no recovery block

%% --- Methods

 %% K8sService.abs:625
 %% K8sService.abs:625
'm_distributeRequest'(O=#object{oid=Oid,cog=Cog=#cog{ref=CogRef,dcobj=DC}},V_req_0,V_activePods_0,Stack)->
    C=(get(this))#state.class,
    put(vars, #{ 'this' => O,
 'req' => V_req_0,
 'activePods' => V_activePods_0 }),
    try
         %% K8sService.abs:626--626
        put(vars, (get(vars))#{'result' => m_ABS_StdLib_funs:f_map(Cog,[],[O,DC| Stack])}),
         %% K8sService.abs:627--627
        put(vars, (get(vars))#{'nPods' => m_ABS_StdLib_funs:f_length(Cog,maps:get('activePods', get(vars)),[O,DC| Stack])}),
         %% K8sService.abs:628--628
        put(vars, (get(vars))#{'batchSize' => m_K8sUtil_funs:f_batchSize(Cog,maps:get('req', get(vars)),[O,DC| Stack])}),
         %% K8sService.abs:629--629
        put(vars, (get(vars))#{'p' => null}),
         %% K8sService.abs:631--631
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
                 %% K8sService.abs:633--633
                put(vars, (get(vars))#{'r1' => builtin:random(Cog,maps:get('nPods', get(vars)))}),
                 %% K8sService.abs:634--634
                put(vars, (get(vars))#{'r2' => builtin:random(Cog,maps:get('nPods', get(vars)))}),
                 %% K8sService.abs:635--635
                []=(fun Loop ([])->
                    case cmp:eq(maps:get('r1', get(vars)),maps:get('r2', get(vars))) of
                    false -> [];
                    true -> receive
                            {stop_world, CogRef} ->
                                cog:task_is_blocked_for_gc(Cog, self(), get(task_info), get(this)),
                                cog:task_is_runnable(Cog,self()),
                                task:wait_for_token(Cog,[O,DC| Stack])
                            after 0 -> ok
                        end,
                         %% K8sService.abs:636--636
                        put(vars, (get(vars))#{'r2' := builtin:random(Cog,maps:get('nPods', get(vars)))}),
                    Loop([])  end end)
                ([]),
                 %% K8sService.abs:639--639
                put(vars, (get(vars))#{'p1' => m_ABS_StdLib_funs:f_nth(Cog,maps:get('activePods', get(vars)),maps:get('r1', get(vars)),[O,DC| Stack])}),
                 %% K8sService.abs:640--640
                put(vars, (get(vars))#{'p2' => m_ABS_StdLib_funs:f_nth(Cog,maps:get('activePods', get(vars)),maps:get('r2', get(vars)),[O,DC| Stack])}),
                 %% K8sService.abs:643--643
                put(vars, (get(vars))#{'reqP1' => m_ABS_StdLib_funs:f_lookupDefault(Cog,C:get_val_internal(get(this), 'pods'),maps:get('p1', get(vars)),0,[O,DC| Stack])}),
                 %% K8sService.abs:644--644
                put(vars, (get(vars))#{'reqP2' => m_ABS_StdLib_funs:f_lookupDefault(Cog,C:get_val_internal(get(this), 'pods'),maps:get('p2', get(vars)),0,[O,DC| Stack])}),
                 %% K8sService.abs:646--646
                case cmp:lt(maps:get('reqP1', get(vars)),maps:get('reqP2', get(vars))) of
                    true ->  %% K8sService.abs:647--647
                    put(vars, (get(vars))#{'p' := maps:get('p1', get(vars))}),
                     %% K8sService.abs:649--649
                    put(this, C:set_val_internal(get(this), 'pods',m_ABS_StdLib_funs:f_put(Cog,C:get_val_internal(get(this), 'pods'),maps:get('p1', get(vars)),(maps:get('reqP1', get(vars)) + 1) ,[O,DC| Stack])));
                    false ->                  %% K8sService.abs:651--651
                put(vars, (get(vars))#{'p' := maps:get('p2', get(vars))}),
                 %% K8sService.abs:653--653
                put(this, C:set_val_internal(get(this), 'pods',m_ABS_StdLib_funs:f_put(Cog,C:get_val_internal(get(this), 'pods'),maps:get('p2', get(vars)),(maps:get('reqP2', get(vars)) + 1) ,[O,DC| Stack])))
                end,
                 %% K8sService.abs:656--656
                put(vars, (get(vars))#{'currentValue' => m_ABS_StdLib_funs:f_lookupDefault(Cog,maps:get('result', get(vars)),maps:get('p', get(vars)),-1,[O,DC| Stack])}),
                 %% K8sService.abs:658--658
                case (not cmp:eq(maps:get('currentValue', get(vars)),-1)) of
                    true ->  %% K8sService.abs:659--659
                    put(vars, (get(vars))#{'currentValue' := (maps:get('currentValue', get(vars)) + 1) }),
                     %% K8sService.abs:660--660
                    put(vars, (get(vars))#{'result' := m_ABS_StdLib_funs:f_put(Cog,maps:get('result', get(vars)),maps:get('p', get(vars)),maps:get('currentValue', get(vars)),[O,DC| Stack])});
                    false ->                  %% K8sService.abs:662--662
                put(vars, (get(vars))#{'result' := m_ABS_StdLib_funs:f_insert(Cog,maps:get('result', get(vars)),{ dataPair,maps:get('p', get(vars)),1},[O,DC| Stack])})
                end,
                 %% K8sService.abs:664--664
                put(vars, (get(vars))#{'batchSize' := (maps:get('batchSize', get(vars)) - 1) }),
            Loop([])  end end)
        ([]),
         %% K8sService.abs:666--666
        maps:get('result', get(vars))
    catch
        _:Exception:Stacktrace ->
            io:format(standard_error, "Uncaught ~s in method distributeRequest and no recovery block in class definition, killing object ~s~n", [builtin:toString(Cog, Exception), builtin:toString(Cog, O)]),
            io:format(standard_error, "stacktrace: ~tp~n", [Stacktrace]),
            object:die(O, Exception), exit(Exception)
    end.
 %% K8sService.abs:669
 %% K8sService.abs:669
'm_refreshPods'(O=#object{oid=Oid,cog=Cog=#cog{ref=CogRef,dcobj=DC}},Stack)->
    C=(get(this))#state.class,
    put(vars, #{ 'this' => O }),
    try
         %% K8sService.abs:670--670
        put(this, C:set_val_internal(get(this), 'pods',m_ABS_StdLib_funs:f_map(Cog,[],[O,DC| Stack]))),
         %% K8sService.abs:671--671
        put(vars, (get(vars))#{'tmp972598720' => cog:create_task(C:get_val_internal(get(this), 'lb'),'m_getPods',[[]],#task_info{method= <<"getPods"/utf8>>, creation={dataTime,builtin:currentms(Cog)}, proc_deadline=dataInfDuration},Cog,true)}),
         %% K8sService.abs:671--671
        future:await(maps:get('tmp972598720', get(vars)), Cog, [O,DC| Stack]),
        ok,
         %% K8sService.abs:671--671
        put(vars, (get(vars))#{'lbPods' => future:get_blocking(maps:get('tmp972598720', get(vars)), Cog, [O,DC| Stack])}),
         %% K8sService.abs:674--679
        put(vars, (get(vars))#{'tmp220038608' => maps:get('lbPods', get(vars))}),
         %% K8sService.abs:674--679
        []=(fun Loop ([])->
            case not (m_ABS_StdLib_funs:f_isEmpty(Cog,maps:get('tmp220038608', get(vars)),[O,DC| Stack])) of
            false -> [];
            true -> receive
                    {stop_world, CogRef} ->
                        cog:task_is_blocked_for_gc(Cog, self(), get(task_info), get(this)),
                        cog:task_is_runnable(Cog,self()),
                        task:wait_for_token(Cog,[O,DC| Stack])
                    after 0 -> ok
                end,
                 %% K8sService.abs:674--679
                put(vars, (get(vars))#{'p' => m_ABS_StdLib_funs:f_head(Cog,maps:get('tmp220038608', get(vars)),[O,DC| Stack])}),
                 %% K8sService.abs:674--679
                put(vars, (get(vars))#{'tmp220038608' := m_ABS_StdLib_funs:f_tail(Cog,maps:get('tmp220038608', get(vars)),[O,DC| Stack])}),
                 %% K8sService.abs:675--675
                put(vars, (get(vars))#{'rm' => m_ABS_StdLib_funs:f_snd(Cog,maps:get('p', get(vars)),[O,DC| Stack])}),
                 %% K8sService.abs:676--676
                put(vars, (get(vars))#{'nReq' => cog:create_task(maps:get('rm', get(vars)),'m_getActiveRequests',[[]],#task_info{method= <<"getActiveRequests"/utf8>>, creation={dataTime,builtin:currentms(Cog)}, proc_deadline=dataInfDuration},Cog,true)}),
                 %% K8sService.abs:677--677
                put(vars, (get(vars))#{'numOfReq' => future:get_blocking(maps:get('nReq', get(vars)), Cog, [O,DC| Stack])}),
                 %% K8sService.abs:678--678
                put(this, C:set_val_internal(get(this), 'pods',m_ABS_StdLib_funs:f_insert(Cog,C:get_val_internal(get(this), 'pods'),{ dataPair,m_ABS_StdLib_funs:f_fst(Cog,maps:get('p', get(vars)),[O,DC| Stack]),maps:get('numOfReq', get(vars))},[O,DC| Stack]))),
            Loop([])  end end)
        ([]),
         %% K8sService.abs:682--682
        cog:suspend_current_task_for_duration(Cog,C:get_val_internal(get(this), 'cycle'),C:get_val_internal(get(this), 'cycle'),[O,DC| Stack]),
        ok,
         %% K8sService.abs:684--684
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
 %% K8sService.abs:688
 %% K8sService.abs:688
'm_setLb'(O=#object{oid=Oid,cog=Cog=#cog{ref=CogRef,dcobj=DC}},V_lb_0,Stack)->
    C=(get(this))#state.class,
    put(vars, #{ 'this' => O,
 'lb' => V_lb_0 }),
    try
         %% K8sService.abs:689--689
        put(this, C:set_val_internal(get(this), 'lb',maps:get('lb', get(vars)))),
         %% K8sService.abs:690--690
        T_1 = cog:create_task(O,'m_refreshPods',[[]],#task_info{method= <<"refreshPods"/utf8>>, creation={dataTime,builtin:currentms(Cog)}, proc_deadline=dataInfDuration},Cog,false),
        T_1,
        dataUnit
        
    catch
        _:Exception:Stacktrace ->
            io:format(standard_error, "Uncaught ~s in method setLb and no recovery block in class definition, killing object ~s~n", [builtin:toString(Cog, Exception), builtin:toString(Cog, O)]),
            io:format(standard_error, "stacktrace: ~tp~n", [Stacktrace]),
            object:die(O, Exception), exit(Exception)
    end.
