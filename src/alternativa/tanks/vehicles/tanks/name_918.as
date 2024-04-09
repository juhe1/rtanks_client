package alternativa.tanks.vehicles.tanks
{
   import alternativa.physics.Body;
   import alternativa.physics.name_886;
   import alternativa.tanks.utils.EncryptedNumberImpl;
   import alternativa.tanks.utils.EncryptedNumber;
   import package_37.Vector3;
   import package_37.name_86;
   import package_46.name_96;
   
   public class name_918
   {
       
      
      private const hash:EncryptedNumber = new EncryptedNumberImpl();
      
      private const const_1622:EncryptedNumber = new EncryptedNumberImpl(Math.random() + 1);
      
      private const const_1619:EncryptedNumber = new EncryptedNumberImpl(Math.random() + 1);
      
      private const const_1621:EncryptedNumber = new EncryptedNumberImpl(Math.random() + 1);
      
      private const const_1620:EncryptedNumber = new EncryptedNumberImpl(Math.random() + 1);
      
      private var name_787:Body;
      
      private const const_1624:Vector3 = new Vector3();
      
      private const const_1623:name_86 = new name_86();
      
      private var var_1704:name_96;
      
      public function name_918(param1:Body, param2:name_96)
      {
         super();
         this.name_787 = param1;
         this.var_1704 = param2;
         this.refresh();
      }
      
      public function refresh() : void
      {
         var _loc1_:name_886 = this.name_787.state;
         var _loc2_:Vector3 = _loc1_.position;
         var _loc3_:name_86 = _loc1_.orientation;
         var _loc4_:Number = Number(this.const_1622.name_900());
         var _loc5_:Number = Number(this.const_1619.name_900());
         var _loc6_:Number = Number(this.const_1621.name_900());
         this.hash.name_894(_loc4_ * _loc2_.x + _loc5_ * _loc2_.y + _loc6_ * _loc2_.z + _loc4_ * _loc3_.x + _loc5_ * _loc3_.y + _loc6_ * _loc3_.z + this.const_1620.name_900() * _loc3_.w);
         this.const_1624.copy(_loc2_);
         this.const_1623.copy(_loc3_);
      }
      
      public function validate() : void
      {
         var _loc1_:name_886 = this.name_787.state;
         var _loc2_:Vector3 = _loc1_.position;
         var _loc3_:name_86 = _loc1_.orientation;
         var _loc4_:Number = Number(this.const_1622.name_900());
         var _loc5_:Number = Number(this.const_1619.name_900());
         var _loc6_:Number = Number(this.const_1621.name_900());
         var _loc7_:Number = _loc4_ * _loc2_.x + _loc5_ * _loc2_.y + _loc6_ * _loc2_.z + _loc4_ * _loc3_.x + _loc5_ * _loc3_.y + _loc6_ * _loc3_.z + this.const_1620.name_900() * _loc3_.w;
         if(_loc7_ != this.hash.name_900())
         {
            trace("PIZDA");
         }
      }
   }
}
