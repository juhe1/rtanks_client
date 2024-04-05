package package_351
{
   import package_352.name_1682;
   
   public class name_3272
   {
       
      
      public var prop:name_1682;
      
      public var distance:Number;
      
      public function name_3272(param1:name_1682, param2:Number)
      {
         super();
         this.prop = param1;
         this.distance = param2;
      }
      
      public function name_3273() : void
      {
         trace("Lod distance",this.distance);
         this.prop.traceProp();
      }
   }
}
