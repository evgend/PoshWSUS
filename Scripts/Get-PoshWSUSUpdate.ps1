function Get-PoshWSUSUpdate {
    <#  
    .SYNOPSIS  
        Retrieves information from a wsus update.
        
    .DESCRIPTION
        Retrieves information from a wsus update. Depending on how the information is presented in the search, more
        than one update may be returned.
         
    .PARAMETER Update
        String to search for. This can be any string for the update to include
        KB article numbers, name of update, category, etc... Use of wildcards (*,%) not allowed in search!
        
    .NOTES  
        Name: Get-PoshWSUSUpdate
        Author: Boe Prox
        DateCreated: 24SEPT2010 
               
    .LINK  
        https://learn-powershell.net
        
    .EXAMPLE 
    Get-PoshWSUSUpdate -update "Exchange"

    Description
    -----------  
    This command will list every update that has 'Exchange' in it.
    
    .EXAMPLE
    Get-PoshWSUSUpdate -update "925474"

    Description
    -----------  
    This command will list every update that has '925474' in it.
    
    .EXAMPLE
    Get-PoshWSUSUpdate

    Description
    -----------  
    This command will list every update on the WSUS Server.    
    #> 
    [cmdletbinding(DefaultParameterSetName = 'Null')]
        Param(
            [Parameter(
                Position = 0,
                ValueFromPipeline = $True,ParameterSetName = 'Update')]
                [string]$Update,
            [Parameter(
                Position = 0,
                ValueFromPipeline = $True,ParameterSetName = 'UpdateObject')]
                [Microsoft.UpdateServices.Administration.UpdateScope]$UpdateScope                                                  
        )
    Begin {                
        $ErrorActionPreference = 'stop' 
        $hash = @{}  
    }
    Process {
        If ($PSBoundParameters['Update']) {
            Write-Verbose "Creating Update Scope with update data"
            $hash['UpdateScope'] = New-PoshWSUSUpdateScope -TextIncludes $Update
        } ElseIf ($PSBoundParameters['UpdateScope']) {
            $hash['UpdateScope'] = $UpdateScope                                                  
        }
        If ($PSCmdlet.ParameterSetName -eq 'Null') {
            Write-Verbose "Getting all updates"
            $wsus.getupdates()
        } Else {
            Write-Verbose "Getting specified updates"
            $wsus.getupdates($hash['UpdateScope'])
        }
    }
    End {
        $ErrorActionPreference = 'continue' 
    }   
}
