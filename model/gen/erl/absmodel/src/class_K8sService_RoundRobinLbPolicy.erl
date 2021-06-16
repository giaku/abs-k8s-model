-module(class_K8sService_RoundRobinLbPolicy).
-include_lib("../include/abs_types.hrl").
-behaviour(object).
-export([get_val_internal/2,set_val_internal/3,init_internal/0,get_state_for_modelapi/1,implemented_interfaces/0,exported/0]).
-compile(export_all).

implemented_interfaces() -> [ <<"ServiceLoadBalancerPolicy">>, <<"Object">> ].

exported() -> #{  }.

%% --- Internal state and low-level accessors

-record(state,{'class'=class_K8sService_RoundRobinLbPolicy,'lb'=null}).
'init_internal'()->
    #state{}.

 %% K8sService.abs:580
'get_val_internal'(#state{'lb'=G},'lb')->
    G;
'get_val_internal'(_,_)->
    %% Invalid return value; handled by HTTP API when querying for non-existant field.
    %% Will never occur in generated code.
    none.

 %% K8sService.abs:580
'set_val_internal'(S,'lb',V)->
    S#state{'lb'=V}.

'get_state_for_modelapi'(S)->
    [
        { 'lb', S#state.'lb' }
    ].
%% --- Constructor: field initializers and init block

'init'(O=#object{oid=Oid,cog=Cog=#cog{ref=CogRef,dcobj=DC}},[Stack])->
    C=(get(this))#state.class,
    put(vars, #{}),
     %% K8sService.abs:580--580
    gc:register_object(O),
    O.
%% --- Class has no recovery block

%% --- Methods

 %% K8sService.abs:582
 %% K8sService.abs:582
'm_distributeRequest'(O=#object{oid=Oid,cog=Cog=#cog{ref=CogRef,dcobj=DC}},V_req_0,V_activePods_0,Stack)->
    C=(get(this))#state.class,
    put(vars, #{ 'this' => O,
 'req' => V_req_0,
 'activePods' => V_activePods_0 }),
    try
         %% K8sService.abs:584--584
        put(vars, (get(vars))#{'result' => m_ABS_StdLib_funs:f_map(Cog,[],[O,DC| Stack])}),
         %% K8sService.abs:586--586
        put(vars, (get(vars))#{'nPods' => m_ABS_StdLib_funs:f_length(Cog,maps:get('activePods', get(vars)),[O,DC| Stack])}),
         %% K8sService.abs:588--588
        put(vars, (get(vars))#{'batchSize' => m_K8sUtil_funs:f_batchSize(Cog,maps:get('req', get(vars)),[O,DC| Stack])}),
         %% K8sService.abs:590--590
        put(vars, (get(vars))#{'p' => null}),
         %% K8sService.abs:592--592
        case cmp:gt(maps:get('nPods', get(vars)),0) of
            true ->  %% K8sService.abs:593--593
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
                     %% K8sService.abs:595--595
                    put(vars, (get(vars))#{'p' := m_ABS_StdLib_funs:f_head(Cog,maps:get('activePods', get(vars)),[O,DC| Stack])}),
                     %% K8sService.abs:596--596
                    put(vars, (get(vars))#{'activePods' := m_ABS_StdLib_funs:f_tail(Cog,maps:get('activePods', get(vars)),[O,DC| Stack])}),
                     %% K8sService.abs:597--597
                    put(vars, (get(vars))#{'activePods' := m_ABS_StdLib_funs:f_appendright(Cog,maps:get('activePods', get(vars)),maps:get('p', get(vars)),[O,DC| Stack])}),
                     %% K8sService.abs:599--599
                    put(vars, (get(vars))#{'currentValue' => m_ABS_StdLib_funs:f_lookupDefault(Cog,maps:get('result', get(vars)),maps:get('p', get(vars)),-1,[O,DC| Stack])}),
                     %% K8sService.abs:601--601
                    case (not cmp:eq(maps:get('currentValue', get(vars)),-1)) of
                        true ->  %% K8sService.abs:602--602
                        put(vars, (get(vars))#{'currentValue' := (maps:get('currentValue', get(vars)) + 1) }),
                         %% K8sService.abs:603--603
                        put(vars, (get(vars))#{'result' := m_ABS_StdLib_funs:f_put(Cog,maps:get('result', get(vars)),maps:get('p', get(vars)),maps:get('currentValue', get(vars)),[O,DC| Stack])});
                        false ->                      %% K8sService.abs:605--605
                    put(vars, (get(vars))#{'result' := m_ABS_StdLib_funs:f_insert(Cog,maps:get('result', get(vars)),{ dataPair,maps:get('p', get(vars)),1},[O,DC| Stack])})
                    end,
                     %% K8sService.abs:607--607
                    put(vars, (get(vars))#{'batchSize' := (maps:get('batchSize', get(vars)) - 1) }),
                Loop([])  end end)
            ([]),
             %% K8sService.abs:609--609
            T_1 = (fun() -> case C:get_val_internal(get(this), 'lb') of
                null -> throw(dataNullPointerException);
                Callee=#object{oid=Oid,cog=Cog} ->
                    %% self-call
                    Vars=get(vars),
                    Result=C:'m_setActivePods'(Callee,maps:get('activePods', get(vars)),[O,DC,Vars| Stack]),
                    put(vars, Vars),
                    Result;
                Callee=#object{oid=ObjRef,cog=Cog} ->
                    %% cog-local call
                    V_aPods = maps:get('activePods', get(vars)),
                    State=get(this),
                    Vars=get(vars),
                    cog:object_state_changed(Cog, O, State),
                    put(this,cog:get_object_state(Callee#object.cog, Callee)),
                    put(task_info,(get(task_info))#task_info{this=Callee}),
                    T=object:get_class_from_state(get(this)), % it's the callee state already
                    Result=T:'m_setActivePods'(Callee, V_aPods,[O,DC,Vars,State| Stack]),
                    cog:object_state_changed(Callee#object.cog, Callee, get(this)),
                    put(task_info,(get(task_info))#task_info{this=O}),
                    put(this, cog:get_object_state(Cog, O)),
                    put(vars, Vars),
                    Result;
                Callee ->
                    %% remote call
                    TempFuture = cog:create_task(Callee,'m_setActivePods',[maps:get('activePods', get(vars)),[]],#task_info{method= <<"setActivePods"/utf8>>},Cog, true),
                    future:get_blocking(TempFuture, Cog, [O,DC| Stack])
            end end)(),
            T_1;
            false ->         ok
        end,
         %% K8sService.abs:613--613
        maps:get('result', get(vars))
    catch
        _:Exception:Stacktrace ->
            io:format(standard_error, "Uncaught ~s in method distributeRequest and no recovery block in class definition, killing object ~s~n", [builtin:toString(Cog, Exception), builtin:toString(Cog, O)]),
            io:format(standard_error, "stacktrace: ~tp~n", [Stacktrace]),
            object:die(O, Exception), exit(Exception)
    end.
 %% K8sService.abs:616
 %% K8sService.abs:616
'm_setLb'(O=#object{oid=Oid,cog=Cog=#cog{ref=CogRef,dcobj=DC}},V_lb_0,Stack)->
    C=(get(this))#state.class,
    put(vars, #{ 'this' => O,
 'lb' => V_lb_0 }),
    try
         %% K8sService.abs:617--617
        put(this, C:set_val_internal(get(this), 'lb',maps:get('lb', get(vars)))),
        dataUnit
        
    catch
        _:Exception:Stacktrace ->
            io:format(standard_error, "Uncaught ~s in method setLb and no recovery block in class definition, killing object ~s~n", [builtin:toString(Cog, Exception), builtin:toString(Cog, O)]),
            io:format(standard_error, "stacktrace: ~tp~n", [Stacktrace]),
            object:die(O, Exception), exit(Exception)
    end.
