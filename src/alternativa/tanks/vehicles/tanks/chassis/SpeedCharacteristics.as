package alternativa.tanks.vehicles.tanks.chassis
{
   import alternativa.tanks.utils.EncryptedNumberImpl;
   import alternativa.tanks.utils.EncryptedNumber;
   
   public class SpeedCharacteristics
   {
       
      
      private var var_1695:EncryptedNumber;
      
      private var const_63:EncryptedNumber;
      
      private var var_1701:EncryptedNumber;
      
      private var var_1698:EncryptedNumber;
      
      private var var_1697:EncryptedNumber;
      
      private var var_1693:EncryptedNumber;
      
      private var var_1696:EncryptedNumber;
      
      private var var_1694:EncryptedNumber;
      
      private var var_1702:EncryptedNumber;
      
      private var var_1699:EncryptedNumber;
      
      private var var_1700:EncryptedNumber;
      
      public function SpeedCharacteristics()
      {
         this.var_1695 = new EncryptedNumberImpl();
         this.const_63 = new EncryptedNumberImpl();
         this.var_1701 = new EncryptedNumberImpl();
         this.var_1698 = new EncryptedNumberImpl();
         this.var_1697 = new EncryptedNumberImpl();
         this.var_1693 = new EncryptedNumberImpl();
         this.var_1696 = new EncryptedNumberImpl();
         this.var_1694 = new EncryptedNumberImpl();
         this.var_1702 = new EncryptedNumberImpl();
         this.var_1699 = new EncryptedNumberImpl();
         this.var_1700 = new EncryptedNumberImpl();
         super();
      }
      
      public function get maxSpeed() : Number
      {
         return this.var_1695.name_900();
      }
      
      public function get acceleration() : Number
      {
         return this.const_63.name_900();
      }
      
      public function get reverseAcceleration() : Number
      {
         return this.var_1701.name_900();
      }
      
      public function get deceleration() : Number
      {
         return this.var_1698.name_900();
      }
      
      public function get turnMaxSpeed() : Number
      {
         return this.var_1697.name_900();
      }
      
      public function get turnAcceleration() : Number
      {
         return this.var_1693.name_900();
      }
      
      public function get turnReverseAcceleration() : Number
      {
         return this.var_1696.name_900();
      }
      
      public function get stabilizationAcceleration() : Number
      {
         return this.var_1694.name_900();
      }
      
      public function get turnDeceleration() : Number
      {
         return this.var_1702.name_900();
      }
      
      public function get sideAcceleration() : Number
      {
         return this.var_1699.name_900();
      }
      
      public function get damping() : Number
      {
         return this.var_1700.name_900();
      }
      
      public function set maxSpeed(param1:Number) : void
      {
         this.var_1695.name_894(param1);
      }
      
      public function set acceleration(param1:Number) : void
      {
         this.const_63.name_894(param1);
      }
      
      public function set reverseAcceleration(param1:Number) : void
      {
         this.var_1701.name_894(param1);
      }
      
      public function set deceleration(param1:Number) : void
      {
         this.var_1698.name_894(param1);
      }
      
      public function set turnMaxSpeed(param1:Number) : void
      {
         this.var_1697.name_894(param1);
      }
      
      public function set turnAcceleration(param1:Number) : void
      {
         this.var_1693.name_894(param1);
      }
      
      public function set turnReverseAcceleration(param1:Number) : void
      {
         this.var_1696.name_894(param1);
      }
      
      public function set stabilizationAcceleration(param1:Number) : void
      {
         this.var_1694.name_894(param1);
      }
      
      public function set turnDeceleration(param1:Number) : void
      {
         this.var_1702.name_894(param1);
      }
      
      public function set sideAcceleration(param1:Number) : void
      {
         this.var_1699.name_894(param1);
      }
      
      public function set damping(param1:Number) : void
      {
         this.var_1700.name_894(param1);
      }
   }
}
