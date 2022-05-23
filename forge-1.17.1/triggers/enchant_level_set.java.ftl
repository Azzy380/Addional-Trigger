<#include "procedures.java.ftl">
@Mod.EventBusSubscriber public class ${name}Procedure {
	private static EnchantmentLevelSetEvent _event;
	@SubscribeEvent public static void onEnchantLevelSet(EnchantmentLevelSetEvent event) {
		_event = event;
		BlockPos enchantPos = event.getPos();
		<#assign dependenciesCode><#compress>
			<@procedureDependenciesCode dependencies, {

			"x": "enchantPos.getX()",
			"y": "enchantPos.getY()",
			"z": "enchantPos.getZ()",
			"world": "event.getWorld()",
			"dimension": "event.getDimension()",
			"power": "event.getPower()",
			"itemstack": "event.getItem()",
			"enchantRow": "event.getEnchantRow()",
			"level": "event.getOriginalLevel()"
			}/>
		</#compress></#assign>
		execute(event<#if dependenciesCode?has_content>,</#if>${dependenciesCode});
	}