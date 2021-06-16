%%This file is licensed under the terms of the Modified BSD License.
-module(abs_constructor_info).
-compile(export_all).
-include_lib("../include/abs_types.hrl").


to_json(Abs=[dataRequest | _]) -> #{
    <<"requestType"/utf8>> => modelapi_v2:abs_to_json(lists:nth(2, Abs)),
    <<"requestCost"/utf8>> => modelapi_v2:abs_to_json(lists:nth(3, Abs)),
    <<"memory"/utf8>> => modelapi_v2:abs_to_json(lists:nth(4, Abs)),
    <<"batchSize"/utf8>> => modelapi_v2:abs_to_json(lists:nth(5, Abs)),
    <<"timeBaseline"/utf8>> => modelapi_v2:abs_to_json(lists:nth(6, Abs)),
    <<"cpuSysLoadPerCostUnit"/utf8>> => modelapi_v2:abs_to_json(lists:nth(7, Abs))
};
to_json(Abs=[dataServiceState | _]) -> #{
    <<"cpuCsmpt"/utf8>> => modelapi_v2:abs_to_json(lists:nth(2, Abs)),
    <<"memoryCsmpt"/utf8>> => modelapi_v2:abs_to_json(lists:nth(3, Abs)),
    <<"cpuRatio"/utf8>> => modelapi_v2:abs_to_json(lists:nth(4, Abs))
};
to_json(Abs=[dataPodConfig | _]) -> #{
    <<"compUnitSize"/utf8>> => modelapi_v2:abs_to_json(lists:nth(2, Abs)),
    <<"monitorCycle"/utf8>> => modelapi_v2:abs_to_json(lists:nth(3, Abs)),
    <<"memoryCooldown"/utf8>> => modelapi_v2:abs_to_json(lists:nth(4, Abs)),
    <<"cpuRequest"/utf8>> => modelapi_v2:abs_to_json(lists:nth(5, Abs)),
    <<"cpuLimit"/utf8>> => modelapi_v2:abs_to_json(lists:nth(6, Abs)),
    <<"costGranularity"/utf8>> => modelapi_v2:abs_to_json(lists:nth(7, Abs))
};
to_json(Abs=[dataServiceConfig | _]) -> #{
    <<"name"/utf8>> => modelapi_v2:abs_to_json(lists:nth(2, Abs)),
    <<"startingPods"/utf8>> => modelapi_v2:abs_to_json(lists:nth(3, Abs)),
    <<"minPods"/utf8>> => modelapi_v2:abs_to_json(lists:nth(4, Abs)),
    <<"maxPods"/utf8>> => modelapi_v2:abs_to_json(lists:nth(5, Abs)),
    <<"scalerCycle"/utf8>> => modelapi_v2:abs_to_json(lists:nth(6, Abs)),
    <<"upscaleThreshold"/utf8>> => modelapi_v2:abs_to_json(lists:nth(7, Abs)),
    <<"downscaleThreshold"/utf8>> => modelapi_v2:abs_to_json(lists:nth(8, Abs)),
    <<"downscalePeriod"/utf8>> => modelapi_v2:abs_to_json(lists:nth(9, Abs))
};
to_json(Abs=[dataPodState | _]) -> #{
    <<"serviceName"/utf8>> => modelapi_v2:abs_to_json(lists:nth(2, Abs)),
    <<"podID"/utf8>> => modelapi_v2:abs_to_json(lists:nth(3, Abs)),
    <<"nodeName"/utf8>> => modelapi_v2:abs_to_json(lists:nth(4, Abs)),
    <<"cpuConsumption"/utf8>> => modelapi_v2:abs_to_json(lists:nth(5, Abs)),
    <<"memoryConsumption"/utf8>> => modelapi_v2:abs_to_json(lists:nth(6, Abs)),
    <<"consumptionRatio"/utf8>> => modelapi_v2:abs_to_json(lists:nth(7, Abs))
};
to_json(Abs=[dataNodeState | _]) -> #{
    <<"nName"/utf8>> => modelapi_v2:abs_to_json(lists:nth(2, Abs)),
    <<"nOfPods"/utf8>> => modelapi_v2:abs_to_json(lists:nth(3, Abs)),
    <<"cpuLoad"/utf8>> => modelapi_v2:abs_to_json(lists:nth(4, Abs)),
    <<"allocatedMemory"/utf8>> => modelapi_v2:abs_to_json(lists:nth(5, Abs)),
    <<"totalCpu"/utf8>> => modelapi_v2:abs_to_json(lists:nth(6, Abs)),
    <<"totalMemory"/utf8>> => modelapi_v2:abs_to_json(lists:nth(7, Abs)),
    <<"requestedCpu"/utf8>> => modelapi_v2:abs_to_json(lists:nth(8, Abs))
};
to_json(Abs=[dataPolyFunction | _]) -> #{
    <<"coeffList"/utf8>> => modelapi_v2:abs_to_json(lists:nth(2, Abs)),
    <<"thresholds"/utf8>> => modelapi_v2:abs_to_json(lists:nth(3, Abs))
};
to_json(Abs=[dataJust | _]) -> #{
    <<"fromJust"/utf8>> => modelapi_v2:abs_to_json(lists:nth(2, Abs))
};
to_json(Abs=[dataLeft | _]) -> #{
    <<"left"/utf8>> => modelapi_v2:abs_to_json(lists:nth(2, Abs))
};
to_json(Abs=[dataRight | _]) -> #{
    <<"right"/utf8>> => modelapi_v2:abs_to_json(lists:nth(2, Abs))
};
to_json(Abs=[dataPair | _]) -> #{
    <<"fst"/utf8>> => modelapi_v2:abs_to_json(lists:nth(2, Abs)),
    <<"snd"/utf8>> => modelapi_v2:abs_to_json(lists:nth(3, Abs))
};
to_json(Abs=[dataTriple | _]) -> #{
    <<"fstT"/utf8>> => modelapi_v2:abs_to_json(lists:nth(2, Abs)),
    <<"sndT"/utf8>> => modelapi_v2:abs_to_json(lists:nth(3, Abs)),
    <<"trdT"/utf8>> => modelapi_v2:abs_to_json(lists:nth(4, Abs))
};
to_json(Abs=[dataCons | _]) -> #{
    <<"head"/utf8>> => modelapi_v2:abs_to_json(lists:nth(2, Abs)),
    <<"tail"/utf8>> => modelapi_v2:abs_to_json(lists:nth(3, Abs))
};
to_json(Abs=[dataTime | _]) -> #{
    <<"timeValue"/utf8>> => modelapi_v2:abs_to_json(lists:nth(2, Abs))
};
to_json(Abs=[dataDuration | _]) -> #{
    <<"durationValue"/utf8>> => modelapi_v2:abs_to_json(lists:nth(2, Abs))
};
to_json(Abs=[dataFin | _]) -> #{
    <<"finvalue"/utf8>> => modelapi_v2:abs_to_json(lists:nth(2, Abs))
};
to_json(Abs=[dataTestsuites | _]) -> #{
    <<"isNamed"/utf8>> => modelapi_v2:abs_to_json(lists:nth(2, Abs)),
    <<"ttss"/utf8>> => modelapi_v2:abs_to_json(lists:nth(3, Abs))
};
to_json(Abs=[dataTestsuite | _]) -> #{
    <<"name"/utf8>> => modelapi_v2:abs_to_json(lists:nth(2, Abs)),
    <<"tcs"/utf8>> => modelapi_v2:abs_to_json(lists:nth(3, Abs))
};
to_json(Abs=[dataTestcase | _]) -> #{
    <<"tcname"/utf8>> => modelapi_v2:abs_to_json(lists:nth(2, Abs)),
    <<"tcclassname"/utf8>> => modelapi_v2:abs_to_json(lists:nth(3, Abs)),
    <<"result"/utf8>> => modelapi_v2:abs_to_json(lists:nth(4, Abs)),
    <<"stdout"/utf8>> => modelapi_v2:abs_to_json(lists:nth(5, Abs)),
    <<"stderr"/utf8>> => modelapi_v2:abs_to_json(lists:nth(6, Abs))
};
to_json(Abs) -> builtin:toString(null, list_to_tuple(Abs)).
