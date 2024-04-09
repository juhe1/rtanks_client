package alternativa.tanks.vehicles.tanks.chassis
{
   import alternativa.tanks.utils.EncryptedNumberImpl;
   import alternativa.tanks.utils.EncryptedNumber;
   
   public class name_2182 implements ValueSmoother
   {
       
      
      private var currentValue:EncryptedNumber;
      
      private var targetValue:EncryptedNumber;
      
      private var smoothingSpeedUp:Number;
      
      private var smoothingSpeedDown:Number;
      
      public function name_2182(param1:Number, param2:Number, param3:Number, param4:Number)
      {
         super();
         this.smoothingSpeedUp = param1;
         this.smoothingSpeedDown = param2;
         this.targetValue = new EncryptedNumberImpl(param3);
         this.currentValue = new EncryptedNumberImpl(param4);
      }
      
      public function reset(param1:Number) : void
      {
         this.currentValue.name_894(param1);
         this.targetValue.name_894(param1);
      }
      
      public function update(param1:Number) : Number
      {
         var _loc2_:Number = this.currentValue.name_900();
         var _loc3_:Number = this.targetValue.name_900();
         if(_loc2_ < _loc3_)
         {
            _loc2_ += this.smoothingSpeedUp * param1;
            if(_loc2_ > _loc3_)
            {
               _loc2_ = _loc3_;
            }
         }
         else if(_loc2_ > _loc3_)
         {
            _loc2_ -= this.smoothingSpeedDown * param1;
            if(_loc2_ < _loc3_)
            {
               _loc2_ = _loc3_;
            }
         }
         this.currentValue.name_894(_loc2_);
         return _loc2_;
      }
      
      public function setTargetValue(param1:Number) : void
      {
         this.targetValue.name_894(param1);
      }
      
      public function getTargetValue() : Number
      {
         return this.targetValue.name_900();
      }
   }
}
