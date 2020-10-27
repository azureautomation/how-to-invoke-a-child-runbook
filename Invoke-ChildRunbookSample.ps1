<#
.SYNOPSIS
	Calls a child runbook synchronously

.DESCRIPTION
	This runbook illustrates how to invoke a child runbook that has been published
	in Azure Automation. 
		
	To run this runbook you first need to download, import and publish the 
    "Get-SettingSample" runbook.  

	You must also have created the following settings: variable, connection, credential & certificate. 


.PARAMETER MyVariable
    String name of the string variable saved in global assets

.PARAMETER MyConnection
    String name of an Azure Automation connection stored in global assets 
                 
.PARAMETER MyCredential
    String name of the PSCredential stored in global assets 

.PARAMETER MyCert
    String name of the certificate uploaded to global assets

.NOTES
	Author: System Center Automation Team 
	Last Updated: 2/6/2014
#>


workflow Invoke-ChildRunbookSample
{
    
    [OutputType( [object] )]
    param (
		# Variable
        [parameter(Mandatory=$true)]
        [String]$MyVariable,

        # Connection
        [parameter(Mandatory=$true)]
        [String]$MyConnection,

        # Credential 
        [parameter(Mandatory=$true)]
        [String]$MyCredential,

		# Certificate
        [parameter(Mandatory=$true)]
        [String]$MyCert
    )
    
    
    # Invoke a child runbook that has output
    $Out = Get-SettingSample -MyVariable $MyVariable -MyConnection $MyConnection -MyCredential $MyCredential -MyCert $MyCert
    
    Write-Output $Out
}