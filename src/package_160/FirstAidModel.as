package package_160
{
   import alternativa.model.IModel;
   import package_13.Long;
   import package_378.FirstAidModelBase;
   import package_378.IFirstAidModelBase;
   import package_4.ClientObject;
   
   public class FirstAidModel extends FirstAidModelBase implements IFirstAidModelBase
   {
       
      
      public function FirstAidModel()
      {
         super();
         _interfaces.push(IModel,IFirstAidModelBase);
      }
      
      public function activated(param1:ClientObject, param2:Long) : void
      {
      }
   }
}
