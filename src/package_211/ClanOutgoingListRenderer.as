package package_211
{
   import package_215.class_194;
   
   public class ClanOutgoingListRenderer extends class_194
   {
       
      
      public function ClanOutgoingListRenderer()
      {
         super();
      }
      
      override public function set data(param1:Object) : void
      {
         item = new name_620(param1.id);
         super.data = param1;
      }
   }
}
