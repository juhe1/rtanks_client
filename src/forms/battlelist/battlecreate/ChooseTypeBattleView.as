package forms.battlelist.battlecreate
{
   import controls.name_3636;
   import flash.display.Sprite;
   import flash.events.MouseEvent;
   import forms.battlelist.BattleMode;
   import package_54.name_102;
   
   public class ChooseTypeBattleView extends Sprite
   {
      
      public static var localeService:name_102;
      
      private static const const_2865:int = 400;
       
      
      private var var_3682:Array;
      
      private var var_3685:name_3636;
      
      private var var_3686:CreateBattleFormView;
      
      private var var_3683:Vector.<String>;
      
      private var var_3684:Vector.<String>;
      
      private var var_3386:Number = 0;
      
      private var var_3385:Number = 0;
      
      public function ChooseTypeBattleView(param1:CreateBattleFormView)
      {
         super();
         this.var_3686 = param1;
         this.method_3291();
      }
      
      private function method_3291() : void
      {
         this.var_3683 = new Vector.<String>();
         this.var_3683.push(name_1663.method_2425);
         this.var_3683.push(name_1663.method_2450);
         this.var_3683.push(name_1663.method_2423);
         this.var_3683.push(name_1663.method_2439);
         this.var_3684 = new Vector.<String>();
         this.var_3684.push(name_1663.method_2436);
         this.var_3684.push(name_1663.method_2440);
         this.var_3684.push(name_1663.method_2426);
         this.var_3684.push(name_1663.method_2431);
      }
      
      public function name_2965(param1:Vector.<BattleMode>) : void
      {
         var _loc2_:name_3636 = null;
         var _loc3_:Object = null;
         this.destroy();
         this.var_3682 = new Array();
         var _loc4_:int = 0;
         while(_loc4_ < param1.length)
         {
            _loc2_ = new name_3636();
            _loc2_.data = param1[_loc4_];
            _loc2_.label = this.var_3683[param1[_loc4_].value];
            addChild(_loc2_);
            _loc3_ = new Object();
            _loc3_.id = param1[_loc4_].value;
            _loc3_.button = _loc2_;
            this.var_3682[_loc4_] = _loc3_;
            _loc4_++;
         }
         this.var_3682.sortOn(["id"],[Array.NUMERIC]);
         this.method_1568();
         this.resize(this.var_3386,this.var_3385);
      }
      
      public function method_1568() : void
      {
         var _loc1_:name_3636 = null;
         var _loc2_:int = 0;
         while(_loc2_ < this.var_3682.length)
         {
            _loc1_ = name_3636(this.var_3682[_loc2_].button);
            _loc1_.addEventListener(MouseEvent.CLICK,this.method_1957);
            _loc2_++;
         }
      }
      
      public function method_1476() : void
      {
         var _loc1_:name_3636 = null;
         var _loc2_:int = 0;
         while(_loc2_ < this.var_3682.length)
         {
            _loc1_ = name_3636(this.var_3682[_loc2_].button);
            _loc1_.removeEventListener(MouseEvent.CLICK,this.method_1957);
            _loc2_++;
         }
      }
      
      public function destroy() : void
      {
         var _loc1_:int = 0;
         if(this.var_3682 != null)
         {
            this.method_1476();
            _loc1_ = 0;
            while(_loc1_ < this.var_3682.length)
            {
               removeChild(this.var_3682[_loc1_].button);
               this.var_3682[_loc1_] = null;
               _loc1_++;
            }
         }
         this.var_3682 = null;
      }
      
      public function resize(param1:Number, param2:Number) : void
      {
         var _loc5_:int = 0;
         var _loc3_:int = 0;
         var _loc4_:int = 0;
         _loc5_ = 0;
         var _loc6_:name_3636 = null;
         var _loc7_:name_3636 = null;
         this.var_3386 = param1;
         this.var_3385 = param2;
         if(this.var_3682 != null)
         {
            _loc3_ = int(this.var_3682.length);
            _loc4_ = int((param1 - (_loc3_ - 1) * 4 + 1) / _loc3_);
            _loc5_ = 0;
            while(_loc5_ < this.var_3682.length)
            {
               _loc6_ = name_3636(this.var_3682[_loc5_].button);
               _loc6_.width = _loc4_;
               if(_loc5_ != 0)
               {
                  _loc7_ = name_3636(this.var_3682[_loc5_ - 1].button);
                  _loc6_.x = _loc7_.x + _loc7_.width + 4;
               }
               _loc5_++;
            }
            this.method_3292();
         }
      }
      
      private function method_3292() : void
      {
         var _loc1_:int = 0;
         var _loc2_:Boolean = this.var_3386 > 400;
         var _loc3_:int = 0;
         while(_loc3_ < this.var_3682.length)
         {
            _loc1_ = int(this.var_3682[_loc3_].id);
            name_3636(this.var_3682[_loc3_]["button"]).label = _loc2_ ? this.var_3683[_loc1_] : this.var_3684[_loc1_];
            _loc3_++;
         }
      }
      
      public function name_3466() : Number
      {
         return this.var_3682 != null ? Number(this.var_3682[0].button.height) : Number(10);
      }
      
      private function method_1957(param1:MouseEvent) : void
      {
         var _loc2_:BattleMode = BattleMode((param1.currentTarget as name_3636).data);
         this.var_3686.method_2755(_loc2_);
      }
      
      public function name_2977(param1:BattleMode) : void
      {
         var _loc2_:name_3636 = null;
         if(this.var_3685 != null)
         {
            this.var_3685.enabled = true;
         }
         var _loc3_:int = 0;
         while(_loc3_ < this.var_3682.length)
         {
            _loc2_ = name_3636(this.var_3682[_loc3_].button);
            if(param1 == BattleMode(_loc2_.data))
            {
               this.var_3685 = _loc2_;
               this.var_3685.enabled = false;
            }
            _loc3_++;
         }
      }
   }
}
