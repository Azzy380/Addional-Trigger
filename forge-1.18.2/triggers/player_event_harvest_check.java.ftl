<#include "procedures.java.ftl">
@Mod.EventBusSubscriber public class ${name}Procedure {
	private static PlayerEvent.HarvestCheck _event;
	@SubscribeEvent public static void onPlayerHarvestCheck(PlayerEvent.HarvestCheck event) {
		_event = event;
		Entity entity = event.getPlayer();
		<#assign dependenciesCode><#compress>
			<@procedureDependenciesCode dependencies, {
			"x": "entity.getX()",
			"y": "entity.getY()",
			"z": "entity.getZ()",
			"world": "entity.level",
			"dimension": "event.getDimension()",
			"entity": "entity",
			"canHarvest": "event.canHarvest()",
			"blockstate": "event.getTargetBlock()"
			}/>
		</#compress></#assign>
		execute(event<#if dependenciesCode?has_content>,</#if>${dependenciesCode});
	}