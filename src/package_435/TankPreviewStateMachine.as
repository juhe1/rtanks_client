package package_435
{
   import flash.utils.Dictionary;
   
   public class TankPreviewStateMachine
   {
       
      
      private var var_3599:Dictionary;
      
      private var var_1784:class_218;
      
      public function TankPreviewStateMachine()
      {
         this.var_3599 = new Dictionary();
         super();
      }
      
      public function name_3197(param1:name_3196, param2:class_218, param3:class_218) : void
      {
         var _loc4_:Dictionary = this.var_3599[param1];
         if(_loc4_ == null)
         {
            _loc4_ = new Dictionary();
            this.var_3599[param1] = _loc4_;
         }
         _loc4_[param2] = param3;
      }
      
      public function name_3517(param1:class_218, param2:name_3196) : void
      {
         var _loc3_:Dictionary = this.var_3599[param2];
         if(_loc3_ == null)
         {
            throw new name_3518();
         }
         var _loc4_:class_218 = _loc3_[param1];
         if(_loc4_ == null)
         {
            throw new name_3519();
         }
         param1.exit();
         _loc4_.enter();
         this.var_1784 = _loc4_;
      }
      
      public function name_749(param1:class_218) : void
      {
         this.var_1784 = param1;
         this.var_1784.enter();
      }
      
      public function name_3204() : void
      {
         this.var_1784.update();
      }
   }
}
