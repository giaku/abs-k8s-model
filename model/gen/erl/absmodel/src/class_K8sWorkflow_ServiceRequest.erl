-module(class_K8sWorkflow_ServiceRequest).
-include_lib("../include/abs_types.hrl").
-behaviour(object).
-export([get_val_internal/2,set_val_internal/3,init_internal/0,get_state_for_modelapi/1,implemented_interfaces/0,exported/0]).
-compile(export_all).

implemented_interfaces() -> [ <<"ServiceTask">>, <<"Object">> ].

exported() -> #{  }.

%% --- Internal state and low-level accessors

-record(state,{'class'=class_K8sWorkflow_ServiceRequest,'se'=null,'request'=null}).
'init_internal'()->
    #state{}.

 %% K8sWorkflow.abs:20
'get_val_internal'(#state{'se'=G},'se')->
    G;
 %% K8sWorkflow.abs:20
'get_val_internal'(#state{'request'=G},'request')->
    G;
'get_val_internal'(_,_)->
    %% Invalid return value; handled by HTTP API when querying for non-existant field.
    %% Will never occur in generated code.
    none.

 %% K8sWorkflow.abs:20
'set_val_internal'(S,'se',V)->
    S#state{'se'=V};
 %% K8sWorkflow.abs:20
'set_val_internal'(S,'request',V)->
    S#state{'request'=V}.

'get_state_for_modelapi'(S)->
    [
        { 'se', S#state.'se' }
        , { 'request', S#state.'request' }
    ].
%% --- Constructor: field initializers and init block

'init'(O=#object{oid=Oid,cog=Cog=#cog{ref=CogRef,dcobj=DC}},[P_se,P_request,Stack])->
    C=(get(this))#state.class,
    put(vars, #{}),
    put(this, C:set_val_internal(get(this),'se',P_se)),
    put(this, C:set_val_internal(get(this),'request',P_request)),
    gc:register_object(O),
    O.
%% --- Class has no recovery block

%% --- Methods

 %% K8sWorkflow.abs:21
 %% K8sWorkflow.abs:21
'm_executeWorkflow'(O=#object{oid=Oid,cog=Cog=#cog{ref=CogRef,dcobj=DC}},Stack)->
    C=(get(this))#state.class,
    put(vars, #{ 'this' => O }),
    try
         %% K8sWorkflow.abs:22--22
        0
    catch
        _:Exception:Stacktrace ->
            io:format(standard_error, "Uncaught ~s in method executeWorkflow and no recovery block in class definition, killing object ~s~n", [builtin:toString(Cog, Exception), builtin:toString(Cog, O)]),
            io:format(standard_error, "stacktrace: ~tp~n", [Stacktrace]),
            object:die(O, Exception), exit(Exception)
    end.
 %% K8sWorkflow.abs:25
 %% K8sWorkflow.abs:25
'm_execute'(O=#object{oid=Oid,cog=Cog=#cog{ref=CogRef,dcobj=DC}},V_pf_0,Stack)->
    C=(get(this))#state.class,
    put(vars, #{ 'this' => O,
 'pf' => V_pf_0 }),
    try
         %% K8sWorkflow.abs:26--26
        put(vars, (get(vars))#{'tmp208824749' => cog:create_task(C:get_val_internal(get(this), 'se'),'m_invokeService',[C:get_val_internal(get(this), 'request'),maps:get('pf', get(vars)),[]],#task_info{method= <<"invokeService"/utf8>>, creation={dataTime,builtin:currentms(Cog)}, proc_deadline=dataInfDuration},Cog,true)}),
         %% K8sWorkflow.abs:26--26
        future:await(maps:get('tmp208824749', get(vars)), Cog, [O,DC| Stack]),
        ok,
         %% K8sWorkflow.abs:26--26
        put(vars, (get(vars))#{'responseTimeDelay' => future:get_blocking(maps:get('tmp208824749', get(vars)), Cog, [O,DC| Stack])}),
         %% K8sWorkflow.abs:28--28
        maps:get('responseTimeDelay', get(vars))
    catch
        _:Exception:Stacktrace ->
            io:format(standard_error, "Uncaught ~s in method execute and no recovery block in class definition, killing object ~s~n", [builtin:toString(Cog, Exception), builtin:toString(Cog, O)]),
            io:format(standard_error, "stacktrace: ~tp~n", [Stacktrace]),
            object:die(O, Exception), exit(Exception)
    end.
 %% K8sWorkflow.abs:31
 %% K8sWorkflow.abs:31
'm_getSize'(O=#object{oid=Oid,cog=Cog=#cog{ref=CogRef,dcobj=DC}},Stack)->
    C=(get(this))#state.class,
    put(vars, #{ 'this' => O }),
    try
         %% K8sWorkflow.abs:32--32
        1
    catch
        _:Exception:Stacktrace ->
            io:format(standard_error, "Uncaught ~s in method getSize and no recovery block in class definition, killing object ~s~n", [builtin:toString(Cog, Exception), builtin:toString(Cog, O)]),
            io:format(standard_error, "stacktrace: ~tp~n", [Stacktrace]),
            object:die(O, Exception), exit(Exception)
    end.
