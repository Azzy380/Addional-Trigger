
<#include "procedures.java.ftl">
@Mod.EventBusSubscriber public class ${name}Procedure {
	@SubscribeEvent public static void onClonePlayer(PlayerEvent.Clone event) {
		Entity entity = event.getPlayer();
		Entity entityOld = event.getOriginal();
		<#assign dependenciesCode><#compress>
			<@procedureDependenciesCode dependencies, {
			"x": "entity.getX()",
			"y": "entity.getY()",
			"z": "entity.getZ()",
			"world": "entity.level",
			"sourceentity": "entityOld",
			"dimension": "event.getDimension()",
			"entity": "entity",
			"wasDeath": "event.isWasDeath()",
			"event": "event"
			}/>
		</#compress></#assign>
		execute(event<#if dependenciesCode?has_content>,</#if>${dependenciesCode})
	}
