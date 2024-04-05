package package_415
{
   import controls.Label;
   import controls.Money;
   import controls.rangicons.name_2924;
   import controls.statassets.name_3007;
   import controls.statassets.name_3010;
   import flash.display.DisplayObject;
   import flash.display.Sprite;
   import flash.text.TextFieldAutoSize;
   import flash.text.TextFormatAlign;
   import package_1.Main;
   
   public class ReferralStatListRenderer extends StatListRenderer
   {
       
      
      public function ReferralStatListRenderer()
      {
         super();
      }
      
      override protected function method_2586(param1:Object) : Sprite
      {
         var _loc2_:Sprite = null;
         var _loc4_:Label = null;
         var _loc5_:Label = null;
         _loc2_ = new Sprite();
         var _loc3_:name_2924 = new name_2924(param1.rank);
         _loc4_ = new Label();
         Main.method_8("REFERALS MODEL","in renderer name = %1, income = %2",param1.callsign,param1.income);
         if(param1.rank > 0)
         {
            _loc3_.y = 3;
            _loc3_.x = 0;
            _loc2_.addChild(_loc3_);
         }
         _loc4_.autoSize = TextFieldAutoSize.NONE;
         _loc4_.height = 18;
         _loc4_.text = param1.callsign;
         _loc4_.x = 12;
         _loc4_.width = _width - 72;
         _loc2_.addChild(_loc4_);
         _loc5_ = new Label();
         _loc5_.autoSize = TextFieldAutoSize.NONE;
         _loc5_.align = TextFormatAlign.RIGHT;
         _loc5_.width = 90;
         _loc5_.x = _width - 100;
         _loc5_.text = param1.income > -1 ? Money.name_876(param1.income,false) : "null";
         _loc2_.addChild(_loc5_);
         return _loc2_;
      }
      
      override public function set data(param1:Object) : void
      {
         _data = param1;
         var _loc2_:DisplayObject = new name_3010();
         var _loc3_:DisplayObject = new name_3007();
         var_2684 = this.method_2586(_data);
         setStyle("upSkin",_loc2_);
         setStyle("downSkin",_loc2_);
         setStyle("overSkin",_loc2_);
         setStyle("selectedUpSkin",_loc3_);
         setStyle("selectedOverSkin",_loc3_);
         setStyle("selectedDownSkin",_loc3_);
      }
   }
}
