package package_167
{
   import package_278.name_1288;
   import package_278.name_905;
   
   public class name_1454
   {
       
      
      public var name_1618:name_905;
      
      public var name_1614:name_905;
      
      public var name_1628:name_1288;
      
      public var name_1622:name_1288;
      
      public var reloadMsec:name_1288;
      
      public function name_1454(param1:int)
      {
         this.name_1618 = new name_905("autoAimingAngleDown ",0);
         this.name_1614 = new name_905("autoAimingAngleUp ",0);
         this.name_1628 = new name_1288("numRaysUp ",0);
         this.name_1622 = new name_1288("numRaysDown ",0);
         this.reloadMsec = new name_1288("reloadMsec");
         super();
         this.reloadMsec.value = param1;
      }
   }
}
