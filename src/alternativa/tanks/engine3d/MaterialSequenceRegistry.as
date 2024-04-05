package alternativa.tanks.engine3d
{
   import alternativa.engine3d.alternativa3d;
   import flash.display.BitmapData;
   import flash.events.TimerEvent;
   import flash.utils.Dictionary;
   import flash.utils.Timer;
   
   public class MaterialSequenceRegistry implements name_968
   {
       
      
      private var var_2817:Boolean;
      
      private var var_2815:Dictionary;
      
      private var var_2816:Vector.<MaterialSequence>;
      
      private var var_2814:int;
      
      private var timer:Timer;
      
      public function MaterialSequenceRegistry(param1:int)
      {
         this.var_2815 = new Dictionary();
         this.var_2816 = new Vector.<MaterialSequence>();
         super();
         this.timer = new Timer(param1);
      }
      
      public function set timerInterval(param1:int) : void
      {
         this.timer.delay = param1;
      }
      
      public function get useMipMapping() : Boolean
      {
         return this.var_2817;
      }
      
      public function set useMipMapping(param1:Boolean) : void
      {
         this.var_2817 = param1;
      }
      
      public function name_1296(param1:name_1076, param2:BitmapData, param3:int, param4:Number, param5:Boolean = false, param6:Boolean = false) : MaterialSequence
      {
         var _loc7_:MaterialSequence = this.var_2815[param2];
         if(_loc7_ == null)
         {
            _loc7_ = new MaterialSequence(this,param2,param3,param6,param5,this.var_2817,param4);
            this.var_2815[param2] = _loc7_;
            this.method_2643(_loc7_);
         }
         ++_loc7_.name_2318;
         return _loc7_;
      }
      
      public function method_1920(param1:name_1076, param2:BitmapData, param3:Number, param4:Boolean = false, param5:Boolean = false) : MaterialSequence
      {
         return this.name_1296(param1,param2,param2.height,param3,param4,param5);
      }
      
      public function clear() : void
      {
         var _loc1_:MaterialSequence = null;
         for each(_loc1_ in this.var_2815)
         {
            this.method_1921(_loc1_);
         }
      }
      
      public function name_2166() : String
      {
         var _loc2_:int = 0;
         var _loc3_:int = 0;
         var _loc4_:int = 0;
         var _loc5_:* = undefined;
         var _loc6_:int = 0;
         var _loc7_:MaterialSequence = null;
         var _loc8_:int = 0;
         var _loc9_:name_2491 = null;
         var _loc10_:int = 0;
         var _loc11_:BitmapData = null;
         var _loc12_:int = 0;
         var _loc13_:int = 0;
         var _loc1_:String = "=== MaterialSequenceRegistry ===\n";
         for(_loc5_ in this.var_2815)
         {
            _loc2_++;
            _loc6_ = 0;
            _loc7_ = this.var_2815[_loc5_];
            _loc8_ = 0;
            while(_loc8_ < _loc7_.materials.length)
            {
               _loc9_ = name_2491(_loc7_.materials[_loc8_]);
               if(_loc9_.alternativa3d::mipMap != null)
               {
                  _loc10_ = 0;
                  while(_loc10_ < _loc9_.alternativa3d::numMaps)
                  {
                     _loc11_ = _loc9_.alternativa3d::mipMap[_loc10_];
                     _loc3_ += _loc11_.height * _loc11_.width * 4;
                     _loc10_++;
                  }
                  _loc6_ += _loc9_.alternativa3d::numMaps;
               }
               else
               {
                  _loc12_ = _loc9_.texture.width;
                  _loc13_ = _loc9_.texture.height;
                  _loc3_ += _loc12_ * _loc13_ * 4;
               }
               _loc8_++;
            }
            _loc4_ += _loc6_;
            _loc1_ += "Sequence " + _loc2_ + ": numMaps: " + _loc6_ + "\n";
         }
         return _loc1_ + ("Total mipmaps: " + _loc4_ + "\n" + "Total bitmap size: " + _loc3_ + "\n" + "Scheduled sequences: " + this.var_2814 + "\n");
      }
      
      public function method_1921(param1:MaterialSequence) : void
      {
         delete this.var_2815[param1.var_2135];
         var _loc2_:int = this.var_2816.indexOf(param1);
         if(_loc2_ > -1)
         {
            this.method_2642(_loc2_);
         }
         param1.dispose();
      }
      
      private function method_2643(param1:MaterialSequence) : void
      {
         var _loc2_:* = this.var_2814++;
         this.var_2816[_loc2_] = param1;
         if(this.var_2814 == 1)
         {
            this.timer.addEventListener(TimerEvent.TIMER,this.onTimer);
            this.timer.start();
         }
      }
      
      private function method_2642(param1:int) : void
      {
         this.var_2816[param1] = this.var_2816[--this.var_2814];
         this.var_2816[this.var_2814] = null;
         if(this.var_2814 == 0)
         {
            this.timer.stop();
            this.timer.removeEventListener(TimerEvent.TIMER,this.onTimer);
         }
      }
      
      private function onTimer(param1:TimerEvent) : void
      {
         var _loc3_:MaterialSequence = null;
         var _loc2_:int = 0;
         while(_loc2_ < this.var_2814)
         {
            _loc3_ = this.var_2816[_loc2_];
            if(_loc3_.tick())
            {
               this.method_2642(_loc2_);
               _loc2_--;
            }
            _loc2_++;
         }
      }
   }
}
