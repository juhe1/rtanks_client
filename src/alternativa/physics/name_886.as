package alternativa.physics
{
   import package_37.Vector3;
   import package_37.name_86;
   
   public class name_886
   {
       
      
      public var position:Vector3;
      
      public var orientation:name_86;
      
      public var name_187:Vector3;
      
      public var name_181:Vector3;
      
      public function name_886()
      {
         this.orientation = new name_86();
         this.name_181 = new Vector3();
         super();
         this.position = new Vector3();
         this.name_187 = new Vector3();
      }
      
      public function copy(param1:name_886) : void
      {
         this.position.vCopy(param1.position);
         this.orientation.copy(param1.orientation);
         this.name_187.vCopy(param1.name_187);
         this.name_181.vCopy(param1.name_181);
      }
      
      public function name_940() : Boolean
      {
         return this.name_187.isFiniteVector() && this.name_181.isFiniteVector() && this.position.isFiniteVector() && this.orientation.method_680();
      }
      
      public function toString() : String
      {
         return "BodyState{velocity=" + String(this.name_187) + ",position=" + String(this.position) + "}";
      }
   }
}
