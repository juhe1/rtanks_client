package package_1
{
   import alternativa.model.class_11;
   import alternativa.osgi.OSGi;
   import alternativa.tanks.model.GarageModel;
   import alternativa.tanks.model.Item3DModel;
   import alternativa.tanks.model.ItemEffectModel;
   import alternativa.tanks.model.ItemModel;
   import alternativa.tanks.model.item.resistance.MountedResistancesEvents;
   import alternativa.tanks.model.item.resistance.MountedResistancesModel;
   import alternativa.tanks.model.item.resistance.ResistanceModuleModel;
   import alternativa.tanks.model.item.resistance.name_1525;
   import alternativa.tanks.model.item.resistance.name_1640;
   import package_11.IBundleActivator;
   import package_110.class_56;
   import package_127.LootBoxModel;
   import package_132.name_1651;
   import package_136.name_1643;
   import package_136.name_1648;
   import package_139.ICountableItemEvents;
   import package_139.name_1538;
   import package_139.name_1642;
   import package_139.name_397;
   import package_140.class_54;
   import package_142.name_1644;
   import package_142.name_1645;
   import package_315.DelayMountCategoryServiceImpl;
   import package_315.name_1357;
   import package_326.ItemActionPanelEvents;
   import package_326.class_55;
   import package_326.name_1636;
   import package_337.name_1639;
   import package_340.AvailableSkinsEvents;
   import package_340.MountSkinEvents;
   import package_340.name_1634;
   import package_340.name_1635;
   import package_340.name_1641;
   import package_340.name_1647;
   import package_340.name_1649;
   import package_340.name_1650;
   import package_341.ItemPropertiesEvents;
   import package_341.ItemPropertiesModel;
   import package_341.name_1633;
   import package_341.name_1646;
   import package_342.name_1637;
   import package_343.name_1638;
   import package_7.name_32;
   import package_89.ResistanceServiceImpl;
   import package_89.name_1358;
   import platform.client.fp10.core.model.name_141;
   import platform.client.fp10.core.model.name_170;
   import platform.client.fp10.core.model.name_287;
   import platform.client.fp10.core.registry.name_29;
   
   public class GarageModelActivator implements IBundleActivator
   {
      
      public static var osgi:OSGi;
       
      
      public var name_322:GarageModel;
      
      public var var_832:ItemModel;
      
      public var var_911:Item3DModel;
      
      public var var_75:ItemEffectModel;
      
      public function GarageModelActivator()
      {
         super();
      }
      
      public function start(param1:OSGi) : void
      {
         GarageModelActivator.osgi = param1;
         var _loc2_:name_32 = param1.getService(name_32) as name_32;
         this.name_322 = new GarageModel();
         _loc2_.add(this.name_322);
         this.var_832 = new ItemModel();
         _loc2_.add(this.var_832);
         this.var_911 = new Item3DModel();
         _loc2_.add(this.var_911);
         this.var_75 = new ItemEffectModel();
         _loc2_.add(this.var_75);
         param1.registerService(name_1357,new DelayMountCategoryServiceImpl());
         param1.registerService(name_1358,new ResistanceServiceImpl());
         var _loc3_:name_29 = param1.getService(name_29) as name_29;
         _loc3_.add(new name_1637(),Vector.<Class>([name_1639,name_141,name_287]));
         _loc3_.add(new LootBoxModel(),Vector.<Class>([class_56,class_55,name_170]));
         _loc3_.name_275(class_56,LootBoxModel);
         _loc3_.name_275(class_55,name_1636);
         _loc3_.name_270(class_55,ItemActionPanelEvents);
         _loc3_.add(new name_397(),Vector.<Class>([class_54,name_1538,class_11]));
         _loc3_.name_275(name_1538,name_1642);
         _loc3_.name_270(name_1538,ICountableItemEvents);
         _loc3_.name_275(name_1633,name_1646);
         _loc3_.name_270(name_1633,ItemPropertiesEvents);
         _loc3_.add(new ItemPropertiesModel(),Vector.<Class>([name_1651,name_1633]));
         _loc3_.add(new ResistanceModuleModel(),Vector.<Class>([name_1645,name_1638,class_55]));
         _loc3_.name_275(name_1525,name_1640);
         _loc3_.name_270(name_1525,MountedResistancesEvents);
         _loc3_.add(new MountedResistancesModel(),Vector.<Class>([name_1644,name_1525]));
         _loc3_.name_275(name_1634,name_1641);
         _loc3_.name_270(name_1634,AvailableSkinsEvents);
         _loc3_.add(new name_1650(),Vector.<Class>([name_1648,name_1634]));
         _loc3_.name_275(name_1635,name_1649);
         _loc3_.name_270(name_1635,MountSkinEvents);
         _loc3_.add(new name_1647(),Vector.<Class>([name_1643,name_1635]));
         param1.name_40(name_1357,ResistanceServiceImpl,"delayMountCategoryService");
      }
      
      public function stop(param1:OSGi) : void
      {
         var _loc2_:name_32 = param1.getService(name_32) as name_32;
         _loc2_.remove(this.name_322.id);
         _loc2_.remove(this.var_832.id);
         _loc2_.remove(this.var_75.id);
         this.name_322 = null;
         this.var_832 = null;
         this.var_911 = null;
         this.var_75 = null;
         GarageModelActivator.osgi = null;
      }
   }
}
