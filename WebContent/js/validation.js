function checkEmpty(data)
{
if(data.length==0)
	{
	return false
	}
else
	{
	
	return true
	}
}


function checkLen(data)
{
if(data.length<8)
	{
	return false
	}
else
{

return true
}
}
function checkCombo(data)
{
if(data=="default")
	{
	return false
	}
else
	{
	
	return true
	}
}

function checkctrl(chkarr)
{
	flag=0;
for(i=0;i<chkarr.length;i++)
	{
	if(chkarr[i].checked)
	     {
		
		flag=1;
		break;
		
	     }
	}
if(flag==0)
	{
	
	return false
	}
else
{return true}

}
