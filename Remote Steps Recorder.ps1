<#
	.NOTES
	===========================================================================
	 Created on:   	29/05/2020 18:27
	 Created by:   	Leee Jeffries
	 GitHub link: 	TBC
	 Twitter: 		@leeejeffries
	===========================================================================
	.DESCRIPTION
        This file will host a small GUI and allow the steps recorder to be run on a remote session to 
        capture user errors and provide enough information for logging or a solid reproduction.
#>

#Logo
$base64IMG = "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"

# Create a streaming image by streaming the base64 string to a bitmap streamsource
$bitmap = New-Object System.Windows.Media.Imaging.BitmapImage
$bitmap.BeginInit()
$bitmap.StreamSource = [System.IO.MemoryStream][System.Convert]::FromBase64String($base64IMG)
$bitmap.EndInit()

#Search for a folder location
#Searches AD for computer objects
Function GrabADComputers {
    #Search through Active Directory for Computer Accounts
    $adSearcher = New-Object DirectoryServices.DirectorySearcher 
    $adSearcher.Filter = "ObjectClass=computer"
    [String[]]$propertiesToReturn = "dnshostname","lastlogon"
    $adSearcher.PropertiesToLoad.AddRange($propertiesToReturn)
    $records = $adSearcher.FindAll()
    #Dispose of the searcher as we should now have all AD computers
    $adSearcher.Dispose()
    
    #Loop through AD computer and spit out a list
    foreach($record in $records) {
        [PSCustomObject]@{
            dnshostname = $record.Properties.dnshostname
            lastlogon = [DateTime]::FromFileTime([Int64]::Parse($record.Properties.lastlogon))
        }
    } #end ForEach
}

#Test Windows Remote Management
Function TestWinRM {
    param (
        $computerName
    )    
    if(test-wsman $computerName -ErrorAction SilentlyContinue){
        "Remotely Manageable"
    } else {
        "Not Remotely Manageable"
    }
}

#Run a remote scheduled task
Function RunRemoteTask {
    param (
        $cimSession,
        $user,
        $command = "C:\Windows\System32\psr.exe",
        $location
    )
    
    $arguments = "/start /gui 0 /output `"$location\PSR_$user_$(Get-Date -Format 'ddMMyyyy_HHmmss').zip`""

    #Action
    #if ($Args.Length -gt 0) { $Action = (New-ScheduledTaskAction –Execute $Command -Argument $Args) }
    $Action = New-ScheduledTaskAction -Execute $command -Argument $arguments

    #Principal
    $P = New-ScheduledTaskPrincipal -UserId $User -LogonType Interactive

    #Settings
    $S = New-ScheduledTaskSettingsSet -MultipleInstances Parallel

    #Create Start Task
    $TASK = New-ScheduledTask -CimSession $cimSession -Action $Action -Settings $S -Principal $P

    #Unregister Start Task if found
    Unregister-ScheduledTask -CimSession $cimSession -TaskName 'PSRSTART' -ErrorAction Ignore -Confirm:$false

    #Register Start Task
    Register-ScheduledTask -CimSession $cimSession -InputObject $TASK -TaskPath '\' -TaskName 'PSRSTART'

    #Execute Start Task
    Get-ScheduledTask -CimSession $cimSession -TaskName 'PSRSTART' -TaskPath '\' | Start-ScheduledTask
}

Function StopRemoteTask {
    param (
        $cimSession,
        $user,
        $command = "C:\Windows\System32\psr.exe",
        $arguments = "/stop"
    )
        
    #Action
    #if ($Args.Length -gt 0) { $Action = (New-ScheduledTaskAction –Execute $Command -Argument $Args) }
    $Action = New-ScheduledTaskAction -Execute $command -Argument $arguments

    #Principal
    $P = New-ScheduledTaskPrincipal -UserId $User -LogonType Interactive

    #Settings
    $S = New-ScheduledTaskSettingsSet -MultipleInstances Parallel

    #Create Stop Task
    $TASK = New-ScheduledTask -CimSession $cimSession -Action $Action -Settings $S -Principal $P

    #Register Stop Task
    Register-ScheduledTask -CimSession $cimSession -InputObject $TASK -TaskPath '\' -TaskName 'PSRSTOP'

    #Execute Stop Task
    Get-ScheduledTask -CimSession $cimSession -TaskName 'PSRSTOP' -TaskPath '\' | Start-ScheduledTask
        
    #Stop Scheduled Tasks
    Get-ScheduledTask -CimSession $cimSession -TaskName 'PSRSTART' -TaskPath '\' | Stop-ScheduledTask
    Get-ScheduledTask -CimSession $cimSession -TaskName 'PSRSTOP' -TaskPath '\' | Stop-ScheduledTask

    #Unregister Scheduled Tasks
    Unregister-ScheduledTask -CimSession $cimSession -TaskName 'PSRSTART' -ErrorAction Ignore -Confirm:$false
    Unregister-ScheduledTask -CimSession $cimSession -TaskName 'PSRSTOP' -ErrorAction Ignore -Confirm:$false
}

Function CheckSteps {
    param (
        $cimSession,
        $user
    )
        
    #Execute TEMPTASK
    Get-ScheduledTask -CimSession $cimSession -TaskName 'TEMPTASK' -TaskPath '\' | Stop-ScheduledTask

    #Unregister TEMPTASK
    Unregister-ScheduledTask -CimSession $cimSession -TaskName 'TEMPTASK' -ErrorAction Ignore -Confirm:$false
}

function Get-LoggedOnUser {

    param (
        $Computer
    )
    $userList = quser /server:$Computer 2>&1 | Select-Object -Skip 1

    $userObject = ForEach ($line in $userList) {
        $CurrentLine = $line.Trim() -Replace '\s+',' ' -replace ">","" -Split '\s'
        
        [PSCustomObject]@{
            UserName = $CurrentLine[0]
            ComputerName = $Computer
        }
    }
    $userObject
}

Function RefreshStatus {
    $wpf.txtDNSName.Text = $wpf.lstADComputers.SelectedItem
    $wpf.txtIPAddress.Text = Resolve-DnsName -Name $wpf.lstADComputers.SelectedItem -Type A -ErrorAction SilentlyContinue | Select-Object -ExpandProperty IPAddress
    $wpf.txtLastLogon.Text = $computerList | Where-Object {$_.dnshostname -eq $wpf.lstADComputers.SelectedItem} | Select-Object -ExpandProperty lastlogon
    $wpf.txtRemoteManage.Text = TestWinRM $wpf.lstADComputers.SelectedItem
    if ($wpf.txtRemoteManage.Text -eq "Not Remotely Manageable") {
        $wpf.txtRemoteManage.Foreground="red"
        $wpf.btnRunStepsRecorder.IsEnabled = $false
    } else {
        $wpf.btnRunStepsRecorder.IsEnabled = $true
        $wpf.txtRemoteManage.Foreground="green"
        #Create the remote connection
        $remoteConnection = New-CimSession -ComputerName $wpf.lstADComputers.SelectedItem -Name "CIM_$($wpf.lstADComputers.SelectedItem)"
        #Add users to the list
        $wpf.lstLoggedInUsers.Items.Clear()        
        foreach ($user in (Get-LoggedOnUser -Computer $wpf.lstADComputers.SelectedItem | Select-Object -ExpandProperty UserName)) {$wpf.lstLoggedInUsers.Items.Add($user)}
        #Remote the remote connection
        $remoteConnection | Remove-CimSession 
    }
}

#Add the Windows Presentation Framework Assembly
Add-Type -AssemblyName presentationframework, presentationcore, system.windows.forms

#GUI layout for the form
[xml]$xaml = @"
<Window
        xmlns="http://schemas.microsoft.com/winfx/2006/xaml/presentation"
        xmlns:x="http://schemas.microsoft.com/winfx/2006/xaml"
        xmlns:d="http://schemas.microsoft.com/expression/blend/2008"
        xmlns:mc="http://schemas.openxmlformats.org/markup-compatibility/2006"

        Title="Remote Steps Recorder" Height="492" Width="842" WindowStyle="SingleBorderWindow" WindowStartupLocation="CenterScreen">
    <Grid Margin="1,0,29,36">
        <Button Name="btnRunStepsRecorder" Content="Run Steps Recorder" HorizontalAlignment="Left" Margin="400,344,0,0" VerticalAlignment="Top" Height="43" Width="130" AutomationProperties.HelpText="Run the steps recorder, will be disable if the machine is not remotely manageable"/>
        <Button Name="btnStopStepsRecorder" Content="Stop Steps Recorder" HorizontalAlignment="Left" Margin="540,344,0,0" VerticalAlignment="Top" Height="43" Width="130" AutomationProperties.HelpText="Stop the steps recorder running to produce the data"/>
        <Button Name="btnClose" Content="Close" HorizontalAlignment="Left" Margin="680,344,0,0" VerticalAlignment="Top" Height="43" Width="80"/>
        <Label Name="lblComputerName" Content="Active Directory Computers" HorizontalAlignment="Left" Margin="10,20,0,0" VerticalAlignment="Top" Width="181"/>
        <ListBox Name="lstADComputers" Margin="10,46,617,95"/>
        <Button Name="btnRefreshComputers" Content="Search/ Refresh AD Computers" HorizontalAlignment="Left" Margin="10,344,0,0" VerticalAlignment="Top" Height="43" Width="185" AutomationProperties.HelpText="Get a list of all AD computer in alphabetical order"/>
        <Label Content="DNS Name" HorizontalAlignment="Left" Height="32" Margin="400,48,0,0" VerticalAlignment="Top" Width="115"/>
        <Label Content="IP Address" HorizontalAlignment="Left" Height="32" Margin="400,85,0,0" VerticalAlignment="Top" Width="115"/>
        <Label Content="Last Logon" HorizontalAlignment="Left" Height="32" Margin="400,122,0,0" VerticalAlignment="Top" Width="115"/>
        <Label Content="Remote Managable:" HorizontalAlignment="Left" Height="32" Margin="400,159,0,0" VerticalAlignment="Top" Width="115"/>
        <Label Content="Steps Recorder Status:" HorizontalAlignment="Left" Height="32" Margin="400,196,0,0" VerticalAlignment="Top" Width="140"/>
        <TextBlock Name="txtDNSName" HorizontalAlignment="Left" Margin="525,53,0,0" TextWrapping="Wrap" VerticalAlignment="Top" Width="191" Height="16" Text="This is a test"/>
        <TextBlock Name="txtIPAddress" HorizontalAlignment="Left" Margin="525,91,0,0" TextWrapping="Wrap" VerticalAlignment="Top" Width="191" Height="16"/>
        <TextBlock Name="txtLastLogon" HorizontalAlignment="Left" Margin="525,128,0,0" TextWrapping="Wrap" VerticalAlignment="Top" Width="191" Height="16"/>
        <TextBlock Name="txtRemoteManage" HorizontalAlignment="Left" Margin="525,164,0,0" TextWrapping="Wrap" VerticalAlignment="Top" Width="191" Height="16"/>
        <TextBlock Name="txtRecorderStatus" HorizontalAlignment="Left" Margin="525,201,0,0" TextWrapping="Wrap" VerticalAlignment="Top" Width="191" Height="16"/>
        <Label Name="lblLoggedInUsers" Content="Users" HorizontalAlignment="Left" Margin="200,20,0,0" VerticalAlignment="Top" Width="158"/>
        <ListBox Name="lstLoggedInUsers" Margin="200,46,417,95"/>
        <Button Name="btnRefreshStatus" Content="Refresh Status" HorizontalAlignment="Left" Margin="400,296,0,0" VerticalAlignment="Top" RenderTransformOrigin="0.25,0.607" Width="130" Height="43" AutomationProperties.HelpText="Click here to refresh the and recheck the machine"/>
        <Label Content="Remote Capture Save Location (\\server\share):" HorizontalAlignment="Left" Height="26" Margin="400,232,0,0" VerticalAlignment="Top" Width="325"/>
        <TextBox Name="txtNetworkLocation" HorizontalAlignment="Left" Margin="400,260,0,0" TextWrapping="Wrap" VerticalAlignment="Top" Width="325" Height="31" AutomationProperties.HelpText="Make sure the location is writeable by the user and machine you are capturing from.">
            <TextBox.Effect>
                <DropShadowEffect/>
            </TextBox.Effect>
        </TextBox>
        <TextBlock HorizontalAlignment="Left" Margin="10,394,0,-25" TextWrapping="Wrap" Width="760" RenderTransformOrigin="0.501,1.138"><Run Text="This tool will remote launch the steps recorder on a machine for a user and capture their activity, this activity will then be uploaded to a files hare for review. Pick and machine, pick and user, run the recorder, all activity is recorder, stop the recorder and open the network location."/><LineBreak/><Run/></TextBlock>
        <Image Name="imgLogo" HorizontalAlignment="Left" Height="57" Margin="697,10,0,0" VerticalAlignment="Top" Width="60"/>
        <Button Name="btnSaveLocation" Content="Open Save &#xD;&#xA;Location" HorizontalAlignment="Left" Margin="680,296,0,0" VerticalAlignment="Top" RenderTransformOrigin="0.25,0.607" Width="80" Height="43" AutomationProperties.HelpText="Click to open the folder share the capture will be stored in"/>
    </Grid>
</Window>
"@

#Create a hash table for entities
$wpf = @{ }

#Put the xaml into a reader
$reader = New-Object System.Xml.XmlNodeReader $xaml

#Build the form from the xaml reader
$window = [Windows.Markup.XamlReader]::Load($reader)

#Find all named entities within the form
$namedNodes = $xaml.SelectNodes("//*[@*[contains(translate(name(.),'n','N'),'Name')]]")

#Load named entities into variables for interaction
$namedNodes | ForEach-Object {$wpf.Add($_.Name, $window.FindName($_.Name))}

#Grab a list of all AD computers
$computerList = GrabADComputers | Sort-Object

#Set the image in the form
$wpf.imgLogo.Source = $bitmap

#Populate AD computers
$wpf.btnRefreshComputers.add_Click({
    $wpf.lstADComputers.Items.Clear()
    ForEach ($computer in $computerList.dnshostname) {$wpf.lstADComputers.Items.Add($computer)}
})

$wpf.lstADComputers.add_SelectionChanged({
    RefreshStatus
})

#Run the steps recorder
$wpf.btnRunStepsRecorder.add_Click({
    $remoteConnection = New-CimSession -ComputerName $wpf.lstADComputers.SelectedItem -Name "CIM_$($wpf.lstADComputers.SelectedItem)"
    Write-Host $remoteConnection | Select-Object *
    RunRemoteTask -cimSession $remoteConnection -user $wpf.lstLoggedInUsers.SelectedItem -location $wpf.txtNetworkLocation.Text
    $PSRInstance = Get-CimInstance -CimSession $remoteConnection -ClassName Win32_Process | Where-Object {$_.ProcessName -eq "psr.exe"} | Invoke-CimMethod -MethodName GetOwner | Where-Object {$_.User -eq ($wpf.lstLoggedInUsers.SelectedItem)}
    if ($PSRInstance) {
        $wpf.txtRecorderStatus.Text = "PSR Recorder is Running"
        $wpf.txtRecorderStatus.Foreground = "green"
    }
    $remoteConnection | Remove-CimSession 
})

#Stop the steps recorder
$wpf.btnStopStepsRecorder.add_Click({
    $remoteConnection = New-CimSession -ComputerName $wpf.lstADComputers.SelectedItem -Name "CIM_$($wpf.lstADComputers.SelectedItem)"
    Write-Host $remoteConnection | Select-Object *
    StopRemoteTask -cimSession $remoteConnection -user $wpf.lstLoggedInUsers.SelectedItem
    $PSRInstance = Get-CimInstance -CimSession $remoteConnection -ClassName Win32_Process | Where-Object {$_.ProcessName -eq "psr.exe"} | Invoke-CimMethod -MethodName GetOwner | Where-Object {$_.User -eq $wpf.lstLoggedInUsers.SelectedItem}
    if ($PSRInstance) {
        $wpf.txtRecorderStatus.Text = "PSR Recorder is no longer running"
        $wpf.txtRecorderStatus.Foreground = "blue"
    }
    $remoteConnection | Remove-CimSession 
})

#Check the folder location
$wpf.txtNetworkLocation.add_SelectionChanged({
    if($wpf.txtNetworkLocation.Text) {
        if (Test-Path $wpf.txtNetworkLocation.Text) {
            $wpf.txtNetworkLocation.Foreground = "green"
            $wpf.btnRunStepsRecorder.IsEnabled = $true
        } else {
            $wpf.txtNetworkLocation.Foreground = "red"
            $wpf.btnRunStepsRecorder.IsEnabled = $false
        }
    }
})

#Refresh machine details
$wpf.btnRefreshStatus.add_Click({
    RefreshStatus
})

#Open the save dialog
$wpf.btnSaveLocation.add_Click({
    Start-Process -FilePath Explorer.exe -ArgumentList $wpf.txtNetworkLocation.Text
})

#Close the dialog
$wpf.btnClose.add_Click({
    $window.Close()
})

#Show the dialog 
$window.ShowDialog()