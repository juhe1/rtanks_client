package alternativa.tanks.models.weapon.machinegun.sfx
{
   import flash.utils.Dictionary;
   import package_238.ObjectPool;
   
   public class ParticleSystem
   {
       
      
      private var method_2483:Dictionary;
      
      private var var_3617:Class;
      
      private var var_3616:Boolean;
      
      private var var_3618:Number = 0;
      
      private var time:Number = 0;
      
      private var count:int;
      
      private var var_3619:int;
      
      private var objectPool:ObjectPool;
      
      public function ParticleSystem(param1:Class, param2:Number, param3:int, param4:ObjectPool)
      {
         this.method_2483 = new Dictionary();
         super();
         this.var_3617 = param1;
         this.var_3618 = param2;
         this.var_3619 = param3;
         this.objectPool = param4;
      }
      
      public function start() : void
      {
         this.var_3616 = true;
      }
      
      public function stop() : void
      {
         this.var_3616 = false;
      }
      
      public function update(param1:Number) : Boolean
      {
         var _loc2_:* = undefined;
         var _loc3_:* = null;
         if(this.var_3616)
         {
            this.time += param1;
            if(this.time >= this.var_3618)
            {
               this.time = 0;
               if(this.count < this.var_3619)
               {
                  this.method_3236();
               }
            }
         }
         for(_loc3_ in this.method_2483)
         {
            this.method_3235(_loc3_,param1);
            if(!_loc3_.alive)
            {
               this.method_3233(_loc3_);
            }
         }
         return this.var_3616 || this.count > 0;
      }
      
      public function clear() : void
      {
         var _loc1_:* = undefined;
         var _loc2_:* = null;
         for(_loc2_ in this.method_2483)
         {
            this.method_3233(_loc2_);
         }
         this.stop();
      }
      
      protected function method_3237(param1:name_3550) : void
      {
      }
      
      protected function method_3235(param1:name_3550, param2:Number) : void
      {
      }
      
      protected function method_3234(param1:name_3550) : void
      {
      }
      
      private function method_3236() : void
      {
         var _loc1_:name_3550 = name_3550(this.objectPool.getObject(this.var_3617));
         _loc1_.alive = true;
         this.method_3237(_loc1_);
         this.method_2483[_loc1_] = true;
         ++this.count;
      }
      
      private function method_3233(param1:name_3550) : void
      {
         this.method_3234(param1);
         delete this.method_2483[param1];
         --this.count;
      }
   }
}
