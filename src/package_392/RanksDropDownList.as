package package_392
{
   import controls.Rank;
   import controls.dropdownlist.DropDownList;
   import flash.events.Event;
   import forms.name_1919;
   
   public class RanksDropDownList extends DropDownList
   {
      
      private static const const_2082:String = "rank";
       
      
      private var const_126:SmallRankIcon;
      
      public function RanksDropDownList(param1:int)
      {
         this.const_126 = new SmallRankIcon();
         super();
         var _loc2_:int = param1;
         while(_loc2_ <= Rank.var_1673.length)
         {
            addItem({
               "gameName":"",
               "rank":_loc2_,
               "rang":0
            });
            _loc2_++;
         }
         this.const_126.x = 9;
         this.const_126.y = 8;
         this.const_126.mouseEnabled = false;
         addChild(this.const_126);
         width = 61;
         addEventListener(Event.CHANGE,this.onChange,false,0,true);
      }
      
      override public function name_1962(param1:String, param2:Object) : void
      {
         var _loc3_:int = method_1581(param1,param2);
         if(_loc3_ != -1)
         {
            var_1348 = var_1347.getItemAt(_loc3_);
            _value = var_1348["rank"];
            this.const_126.init(false,int(_value));
            method_1583().selectedIndex = _loc3_;
            method_1583().scrollToSelected();
         }
      }
      
      private function onChange(param1:Event) : void
      {
         this.name_1962("rank",selectedItem["rank"]);
      }
      
      override public function method_1578(param1:Class) : void
      {
         method_1583().setStyle(name_1919.name_1920,RanksRenderer);
      }
   }
}
