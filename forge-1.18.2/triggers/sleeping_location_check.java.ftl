<#include "procedures.java.ftl">
@Mod.EventBusSubscriber public class ${name}Procedure {
	@SubscribeEvent public static void onGameChecksPlayerInBed(SleepingLocationCheckEvent event) {
		BlockPos sleepPos = event.getSleepingLocation();
		Entity entity = event.getEntity();
		<#assign dependenciesCode><#compress>
			<@procedureDependenciesCode dependencies, {
			"x": "entity.getX()",
			"y": "entity.getY()",
			"z": "entity.getZ()",
			"xSleep": "sleepPos.getX()",
			"ySleep": "sleepPos.getY()",
			"zSleep": "sleepPos.getZ()",
			"world": "event.getWorld()",
			"dimension": "event.getDimension()"
			}/>
		</#compress></#assign>
		execute(event<#if dependenciesCode?has_content>,</#if>${dependenciesCode});
	}