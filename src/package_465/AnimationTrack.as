package package_465
{
   public class AnimationTrack
   {
       
      
      private var const_2460:Vector.<Number>;
      
      private var method_393:Vector.<Number>;
      
      private var numFrames:int;
      
      private var var_3591:Number;
      
      private var var_1886:Number;
      
      public function AnimationTrack(param1:Vector.<Number>, param2:Vector.<Number>)
      {
         super();
         this.const_2460 = param1;
         this.method_393 = param2;
         this.numFrames = param1.length;
         this.var_3591 = param1[0];
         this.var_1886 = param1[this.numFrames - 1];
      }
      
      public function method_3210(param1:int) : Number
      {
         return this.const_2460[param1];
      }
      
      public function name_2313() : int
      {
         return this.numFrames;
      }
      
      public function method_3209() : Number
      {
         return this.var_3591;
      }
      
      public function method_3211() : Number
      {
         return this.var_1886;
      }
      
      public function method_3208(param1:int) : Number
      {
         return this.method_393[param1];
      }
   }
}
