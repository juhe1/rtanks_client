package package_1
{
   import alternativa.osgi.CommonBundleActivator;
   import alternativa.osgi.OSGi;
   import alternativa.tanks.models.battlefield.StatisticsModel;
   import alternativa.tanks.models.battlefield.gui.chat.ChatModel;
   import package_50.EffectsVisualizationModel;
   import package_80.InventoryItemModel;
   import package_80.InventoryModel;
   
   public class name_19 extends CommonBundleActivator
   {
       
      
      public function name_19()
      {
         super();
      }
      
      override public function start(param1:OSGi) : void
      {
         method_117(new ChatModel(),param1);
         method_117(new StatisticsModel(),param1);
         method_117(new InventoryModel(),param1);
         method_117(new InventoryItemModel(),param1);
         method_117(new EffectsVisualizationModel(),param1);
      }
   }
}
