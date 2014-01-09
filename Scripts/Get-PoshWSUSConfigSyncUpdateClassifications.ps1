function Get-PoshWSUSConfigSyncUpdateClassifications {
    <#
    .Synopsis
       The Get-PoshWSUSSyncUpdateClassifications cmdlet gets the list of Windows Server Update Services (WSUS) classifications that will be synchronized.
    
    .DESCRIPTION
       Длинное описание
    
    .NOTES  
        Name: Get-PoshWSUSConfigSyncUpdateCategories
        Author: Dubinsky Evgeny
        DateCreated: 10MAY2013

    .EXAMPLE
       Get-PoshWSUSConfigSyncUpdateClassifications

       Description
       -----------
       This command gets classification that sync with  Windows Server Update Services (WSUS).

    .LINK
        http://blog.itstuff.in.ua/?p=62#Get-PoshWSUSConfigSyncUpdateClassifications
    #>
    [CmdletBinding(DefaultParameterSetName = 'Null')]
    Param()

    Begin {}
    Process
    {
        if ($wsus)
        {
            $wsus.GetSubscription().GetUpdateClassifications()
        }
        else
        {
            Write-Warning "Use Connect-PoshWSUSServer for establish connection with your Windows Update Server"
            Break
        }
    }
    End{}
}