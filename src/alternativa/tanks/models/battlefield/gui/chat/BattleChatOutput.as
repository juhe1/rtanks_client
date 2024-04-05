package alternativa.tanks.models.battlefield.gui.chat
{
   import package_294.name_2538;
   import package_427.class_179;
   import package_427.name_2537;
   import package_47.BattleTeamType;
   
   public class BattleChatOutput extends class_179
   {
       
      
      private const const_1563:int = 100;
      
      private const const_1886:int = 5;
      
      private var buffer:Array;
      
      private var var_2218:Boolean = true;
      
      public function BattleChatOutput()
      {
         this.buffer = [];
         super();
      }
      
      public function method_223(param1:int, param2:int, param3:String, param4:BattleTeamType, param5:Boolean, param6:String) : void
      {
         if(this.var_2218 && var_170.numChildren > 5 || !this.var_2218 && var_170.numChildren >= 100)
         {
            this.name_1352();
         }
         var _loc7_:name_2540 = new name_2540(300,param1,param2,param3,param6,param4,param5);
         _loc7_.addEventListener(name_2538.name_2539,this.method_2286);
         this.buffer.push(_loc7_);
         if(this.buffer.length > 100)
         {
            this.buffer.shift();
         }
         method_2285(_loc7_);
      }
      
      public function name_1354(param1:String, param2:Boolean) : void
      {
         if(this.var_2218 && var_170.numChildren > 5 || !this.var_2218 && var_170.numChildren >= 100)
         {
            this.name_1352();
         }
         var _loc3_:name_2541 = new name_2541(300,param1,param2);
         _loc3_.addEventListener(name_2538.name_2539,this.method_2286);
         this.buffer.push(_loc3_);
         if(this.buffer.length > 100)
         {
            this.buffer.shift();
         }
         method_2285(_loc3_);
      }
      
      public function addSystemMessage(param1:String) : void
      {
         if(this.var_2218 && var_170.numChildren > 5 || !this.var_2218 && var_170.numChildren >= 100)
         {
            this.name_1352();
         }
         var _loc2_:name_2542 = new name_2542(300,param1);
         _loc2_.addEventListener(name_2538.name_2539,this.method_2286);
         this.buffer.push(_loc2_);
         if(this.buffer.length > 100)
         {
            this.buffer.shift();
         }
         method_2285(_loc2_);
      }
      
      override public function name_1352(param1:Boolean = false) : name_2537
      {
         var _loc2_:name_2537 = super.name_1352();
         this.y += shift;
         if(param1)
         {
            this.buffer.shift();
         }
         return _loc2_;
      }
      
      public function name_1355() : void
      {
         var _loc1_:int = 0;
         var _loc3_:name_2537 = null;
         this.var_2218 = false;
         var _loc2_:int = this.buffer.length - var_170.numChildren;
         _loc1_ = 0;
         while(_loc1_ < var_170.numChildren)
         {
            _loc3_ = name_2537(var_170.getChildAt(_loc1_));
            _loc3_.name_2544();
            _loc1_++;
         }
         _loc1_ = _loc2_ - 1;
         while(_loc1_ >= 0)
         {
            try
            {
               method_2284(name_2537(this.buffer[_loc1_]));
            }
            catch(err:Error)
            {
            }
            _loc1_--;
         }
      }
      
      public function name_1353() : void
      {
         var _loc1_:int = 0;
         var _loc3_:name_2537 = null;
         this.var_2218 = true;
         var _loc2_:int = var_170.numChildren - 5;
         _loc1_ = 0;
         while(_loc1_ < _loc2_)
         {
            this.name_1352();
            _loc1_++;
         }
         _loc1_ = 0;
         while(_loc1_ < var_170.numChildren)
         {
            _loc3_ = name_2537(var_170.getChildAt(_loc1_));
            if(!_loc3_.alive)
            {
               this.name_1352();
               _loc1_--;
            }
            else
            {
               _loc3_.name_2543();
            }
            _loc1_++;
         }
      }
      
      public function clear() : void
      {
         this.buffer.length = 0;
         var _loc1_:int = var_170.numChildren - 1;
         while(_loc1_ >= 0)
         {
            var_170.removeChildAt(_loc1_);
            _loc1_--;
         }
      }
      
      private function method_2286(param1:name_2538) : void
      {
         if(this.var_2218 && var_170.contains(param1.line))
         {
            this.name_1352();
         }
         param1.line.removeEventListener(name_2538.name_2539,this.method_2286);
      }
   }
}
