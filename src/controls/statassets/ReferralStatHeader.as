package controls.statassets
{
   import flash.display.Sprite;
   import flash.events.MouseEvent;
   import package_1.Main;
   import package_280.name_3005;
   import package_54.name_102;
   import package_60.TextConst;
   
   public class ReferralStatHeader extends Sprite
   {
       
      
      protected var var_1207:Array;
      
      protected var var_3519:Array;
      
      protected var var_3518:int = 1;
      
      protected var var_3520:int = 1;
      
      protected var _width:int = 800;
      
      public function ReferralStatHeader()
      {
         var _loc2_:name_3470 = null;
         this.var_1207 = new Array();
         super();
         var _loc1_:name_102 = name_102(Main.osgi.name_6(name_102));
         this.var_3519 = [_loc1_.getText(TextConst.REFERAL_STATISTICS_HEADER_CALLSIGN),_loc1_.getText(TextConst.REFERAL_STATISTICS_HEADER_INCOME)];
         var _loc3_:int = 0;
         while(_loc3_ < 2)
         {
            _loc2_ = new name_3470(_loc3_ == 1);
            _loc2_.label = this.var_3519[_loc3_];
            _loc2_.height = 18;
            _loc2_.name_3471 = _loc3_;
            addChild(_loc2_);
            _loc2_.addEventListener(MouseEvent.CLICK,this.method_2794);
            _loc3_++;
         }
         this.draw();
      }
      
      protected function draw() : void
      {
         var _loc1_:name_3470 = null;
         var _loc3_:int = 0;
         var _loc2_:int = int(this._width - 345);
         this.var_1207 = [0,this._width - 120,this._width - 1];
         _loc3_ = 0;
         while(_loc3_ < 2)
         {
            _loc1_ = getChildAt(_loc3_) as name_3470;
            _loc1_.width = this.var_1207[_loc3_ + 1] - this.var_1207[_loc3_] - 2;
            _loc1_.x = this.var_1207[_loc3_];
            _loc1_.selected = _loc3_ == this.var_3518;
            _loc3_++;
         }
      }
      
      protected function method_2794(param1:MouseEvent) : void
      {
         var _loc2_:name_3470 = param1.currentTarget as name_3470;
         this.var_3518 = _loc2_.name_3471;
         if(this.var_3518 != this.var_3520)
         {
            this.draw();
            dispatchEvent(new name_3005(name_3005.name_3013,0,0,this.var_3518));
            this.var_3520 = this.var_3518;
         }
      }
      
      override public function set width(param1:Number) : void
      {
         this._width = Math.floor(param1);
         this.draw();
      }
   }
}
