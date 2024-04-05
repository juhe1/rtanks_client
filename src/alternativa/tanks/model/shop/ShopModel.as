package alternativa.tanks.model.shop
{
   import flash.events.Event;
   import package_1.Main;
   import package_177.DialogsService;
   import package_177.name_550;
   import package_411.name_2247;
   import package_54.name_102;
   import scpacker.networking.Network;
   import scpacker.networking.name_2;
   
   public class ShopModel
   {
       
      
      private var localeService:name_102;
      
      private var var_102:DialogsService;
      
      private var window:name_2246;
      
      private var var_1774:name_2248;
      
      public function ShopModel()
      {
         super();
      }
      
      public function init(param1:Object) : void
      {
         var _loc2_:Object = null;
         var _loc3_:Array = null;
         var _loc4_:Object = null;
         this.localeService = Main.osgi.name_6(name_102) as name_102;
         this.var_102 = Main.osgi.name_6(name_550) as DialogsService;
         name_2246.name_2252 = param1.have_double_crystals;
         this.window = new name_2246();
         this.var_102.name_1001(this.window);
         this.var_1774 = new name_2248();
         var _loc5_:Object = param1.data;
         var _loc6_:String = String((Main.osgi.name_6(name_102) as name_102).language);
         if(_loc6_ == null)
         {
            _loc6_ = "EN";
         }
         else
         {
            _loc6_ = _loc6_.toUpperCase();
         }
         var _loc7_:Array = _loc5_.categories;
         for each(_loc2_ in _loc7_)
         {
            this.window.name_2251(_loc2_.header_text[_loc6_],_loc2_.description[_loc6_],_loc2_.category_id);
         }
         _loc3_ = _loc5_.items;
         for each(_loc4_ in _loc3_)
         {
            this.window.addItem(_loc4_.category_id,_loc4_.item_id,_loc4_.additional_data);
         }
         this.window.addEventListener(name_2247.name_2254,this.method_1955);
         this.window.addEventListener(Event.CLOSE,this.method_1679);
      }
      
      private function method_1679(param1:Event) : void
      {
         this.var_102.name_1013(this.window);
         this.window.removeEventListener(Event.CLOSE,this.method_1679);
         this.window = null;
         this.var_1774.destroy();
      }
      
      private function onResize(param1:Event = null) : void
      {
      }
      
      public function method_1956() : void
      {
      }
      
      private function method_1955(param1:name_2247) : void
      {
         var _loc2_:String = param1.itemId;
         if(_loc2_.indexOf("promocode") > -1)
         {
            this.window.name_2249(this.var_1774.name_2253());
         }
         else
         {
            Network(Main.osgi.name_6(name_2)).send("lobby;shop_buy_item;" + param1.itemId + ";" + this.window.header.name_2250.selectedItem.code);
         }
      }
   }
}
