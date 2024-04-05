package package_214
{
   import controls.dropdownlist.DropDownList;
   import fl.events.ListEvent;
   import flash.events.Event;
   import forms.name_1919;
   import package_275.name_865;
   import package_30.name_63;
   import package_54.name_102;
   
   public class FlagsDropDownList extends DropDownList
   {
      
      public static var localeService:name_102;
      
      public static var clanCreateService:name_63;
      
      private static const const_1551:String = "country";
       
      
      public var flag:name_634;
      
      public function FlagsDropDownList()
      {
         this.flag = new name_634();
         super();
         var _loc1_:int = 0;
         while(_loc1_ < clanCreateService.flags.length)
         {
            addItem({
               "country":clanCreateService.flags[_loc1_],
               "gameName":""
            });
            _loc1_++;
         }
         this.name_1962("country",clanCreateService.defaultFlag);
         width = 70;
         this.flag.mouseEnabled = false;
         addChild(this.flag);
         this.flag.x = 8;
         this.flag.y = 30 - this.flag.height >> 1;
         addEventListener(Event.CHANGE,this.onChange,false,0,true);
         height = (Math.min(clanCreateService.flags.length,6) + 1) * rowHeight + 14;
      }
      
      override public function method_1578(param1:Class) : void
      {
         method_1583().setStyle(name_1919.name_1920,FlagsRenderer);
      }
      
      override public function name_1962(param1:String, param2:Object) : void
      {
         var _loc3_:int = 0;
         _loc3_ = 0;
         _loc3_ = method_1581(param1,param2);
         if(_loc3_ != -1)
         {
            var_1348 = var_1347.getItemAt(_loc3_);
            _value = var_1348["country"];
            this.flag.name_1877(name_865(_value));
            method_1583().selectedIndex = _loc3_;
            method_1583().scrollToSelected();
         }
      }
      
      private function onChange(param1:Event) : void
      {
         this.name_1962("country",selectedItem["country"]);
      }
      
      override protected function method_1577(param1:ListEvent) : void
      {
         var _loc2_:Object = param1.item;
         var_1352 = param1.index;
         var_1348 = _loc2_;
         close();
         dispatchEvent(new Event(Event.CHANGE));
      }
   }
}
