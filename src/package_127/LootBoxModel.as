package package_127
{
   import alternativa.osgi.OSGi;
   import flash.display.DisplayObjectContainer;
   import flash.events.IEventDispatcher;
   import flash.events.MouseEvent;
   import package_110.LootBoxModelBase;
   import package_110.class_56;
   import package_110.name_331;
   import package_139.name_1538;
   import package_177.name_550;
   import package_326.class_55;
   import platform.client.fp10.core.model.name_170;
   
   public class LootBoxModel extends LootBoxModelBase implements class_56, name_170, class_55
   {
      
      public static var var_864:name_550 = OSGi.getInstance().name_6(name_550) as name_550;
       
      
      private var var_863:LootBoxOpenDialog;
      
      public function LootBoxModel()
      {
         super();
      }
      
      private static function method_1106() : int
      {
         return name_1538(object.name_176(name_1538)).getCount();
      }
      
      public function objectLoaded() : void
      {
         var _loc1_:name_1580 = new name_1580();
         _loc1_.name_1581(method_1106() > 0);
         _loc1_.name_1583.addEventListener(MouseEvent.CLICK,method_39(this.method_1107),false,0,true);
         putData(name_1580,_loc1_);
      }
      
      public function updateActionElements(param1:DisplayObjectContainer, param2:IEventDispatcher) : void
      {
         var _loc3_:name_1580 = this.getPanel();
         _loc3_.updateActionElements(param1);
         _loc3_.name_1581(method_1106() > 0);
      }
      
      private function method_1107(param1:MouseEvent) : void
      {
         this.var_863 = new LootBoxOpenDialog(method_771(),method_1106());
         this.var_863.addEventListener(name_1582.OPEN,method_39(this.method_1108),false,0,true);
         var_864.name_1585(this.var_863);
      }
      
      private function method_1108(param1:name_1582) : void
      {
         server.open(param1.count);
      }
      
      public function handleDoubleClickOnItemPreview() : void
      {
         trace("paymentService.openPaymentAt(ShopCategoryEnum.LOOT_BOXES)");
      }
      
      public function name_422(param1:Vector.<name_331>) : void
      {
         this.var_863.name_1584(param1);
         this.getPanel().name_1581(method_1106() > 0);
      }
      
      private function getPanel() : name_1580
      {
         return getData(name_1580) as name_1580;
      }
   }
}
