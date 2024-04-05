package alternativa.tanks.utils
{
   import package_37.Vector3;
   
   public class name_2391
   {
       
      
      private var var_514:Vector3;
      
      private var x:EncryptedNumber;
      
      private var y:EncryptedNumber;
      
      private var z:EncryptedNumber;
      
      public function name_2391(param1:Vector3)
      {
         super();
         this.var_514 = param1;
         this.x = new EncryptedNumberImpl(param1.x);
         this.y = new EncryptedNumberImpl(param1.y);
         this.z = new EncryptedNumberImpl(param1.z);
      }
      
      public function isInvalid() : Boolean
      {
         return this.var_514.x != this.x.name_900() || this.var_514.y != this.y.name_900() || this.var_514.z != this.z.name_900();
      }
      
      public function name_940() : Boolean
      {
         return !this.isInvalid();
      }
      
      public function method_2838() : String
      {
         return "";
      }
   }
}
