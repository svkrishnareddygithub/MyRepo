public class Sridhar_Killing_Task
{
    public void m(Integer starting,integer ending)
    {
        List<Integer> persons=new List<Integer>();
        for(Integer j=starting; j<=ending; j++)
        {
            persons.add(j);
            System.debug(j);
        }
        
        integer i=0;
        while(persons.size()>1)
        {
            i++;
            //system.debug(i+'kkk');
            if(i-persons.size()==1)
            {
                i=1;    
            }
            else if(persons.size()==i)
            {
                i=0;    
            }
            persons.remove(i);
            if(persons.size()==1)
            {
                break;
            }
        }
        system.debug('The person who survived is '+persons);
    }
}