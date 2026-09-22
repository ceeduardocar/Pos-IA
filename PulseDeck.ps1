#requires -Version 5.1
[CmdletBinding()]
param()

Add-Type -AssemblyName PresentationFramework, PresentationCore, WindowsBase

$xaml = @'
<Window xmlns="http://schemas.microsoft.com/winfx/2006/xaml/presentation"
        xmlns:x="http://schemas.microsoft.com/winfx/2006/xaml"
        Title="PulseDeck" Width="1180" Height="760" MinWidth="980" MinHeight="650"
        WindowStartupLocation="CenterScreen" Background="#080B14" FontFamily="Segoe UI"
        Foreground="#F5F7FF">
  <Window.Resources>
    <SolidColorBrush x:Key="Muted" Color="#8892A8" />
    <SolidColorBrush x:Key="Panel" Color="#111625" />
    <SolidColorBrush x:Key="PanelBorder" Color="#222B42" />
    <Style x:Key="Card" TargetType="Border">
      <Setter Property="Background" Value="{StaticResource Panel}" />
      <Setter Property="BorderBrush" Value="{StaticResource PanelBorder}" />
      <Setter Property="BorderThickness" Value="1" />
      <Setter Property="CornerRadius" Value="18" />
      <Setter Property="Padding" Value="22" />
      <Setter Property="Margin" Value="7" />
    </Style>
    <Style TargetType="ProgressBar">
      <Setter Property="Height" Value="7" />
      <Setter Property="Background" Value="#20283A" />
      <Setter Property="Foreground" Value="#7C5CFF" />
      <Setter Property="BorderThickness" Value="0" />
    </Style>
    <Style TargetType="Button">
      <Setter Property="Background" Value="#7C5CFF" />
      <Setter Property="Foreground" Value="White" />
      <Setter Property="BorderThickness" Value="0" />
      <Setter Property="Padding" Value="20,11" />
      <Setter Property="FontWeight" Value="SemiBold" />
      <Setter Property="Cursor" Value="Hand" />
      <Setter Property="Template">
        <Setter.Value>
          <ControlTemplate TargetType="Button">
            <Border Background="{TemplateBinding Background}" CornerRadius="10" Padding="{TemplateBinding Padding}">
              <ContentPresenter HorizontalAlignment="Center" VerticalAlignment="Center" />
            </Border>
          </ControlTemplate>
        </Setter.Value>
      </Setter>
    </Style>
  </Window.Resources>

  <Grid Margin="28">
    <Grid.RowDefinitions>
      <RowDefinition Height="Auto" />
      <RowDefinition Height="Auto" />
      <RowDefinition Height="*" />
      <RowDefinition Height="Auto" />
    </Grid.RowDefinitions>

    <Grid Grid.Row="0" Margin="8,2,8,22">
      <Grid.ColumnDefinitions><ColumnDefinition /><ColumnDefinition Width="Auto" /></Grid.ColumnDefinitions>
      <StackPanel>
        <StackPanel Orientation="Horizontal">
          <Border Width="42" Height="42" CornerRadius="12" Background="#7C5CFF" Margin="0,0,13,0">
            <TextBlock Text="◈" FontSize="26" HorizontalAlignment="Center" VerticalAlignment="Center" />
          </Border>
          <StackPanel>
            <TextBlock Text="PULSEDECK" FontSize="23" FontWeight="Bold" />
            <TextBlock Text="CENTRAL DE TELEMETRIA" FontSize="10" Foreground="#8F7CFF" FontWeight="Bold" />
          </StackPanel>
        </StackPanel>
      </StackPanel>
      <StackPanel Grid.Column="1" Orientation="Horizontal" VerticalAlignment="Center">
        <Ellipse Width="9" Height="9" Fill="#36E3A2" Margin="0,0,8,0" />
        <TextBlock Text="SISTEMA ONLINE" FontSize="11" Foreground="#36E3A2" FontWeight="Bold" VerticalAlignment="Center" />
      </StackPanel>
    </Grid>

    <Grid Grid.Row="1">
      <Grid.ColumnDefinitions><ColumnDefinition /><ColumnDefinition /><ColumnDefinition /></Grid.ColumnDefinitions>
      <Border Grid.Column="0" Style="{StaticResource Card}">
        <StackPanel>
          <TextBlock Text="PROCESSADOR" Foreground="{StaticResource Muted}" FontSize="11" FontWeight="Bold" />
          <TextBlock x:Name="CpuValue" Text="--%" FontSize="38" FontWeight="Light" Margin="0,9,0,12" />
          <ProgressBar x:Name="CpuBar" Maximum="100" />
        </StackPanel>
      </Border>
      <Border Grid.Column="1" Style="{StaticResource Card}">
        <StackPanel>
          <TextBlock Text="MEMÓRIA" Foreground="{StaticResource Muted}" FontSize="11" FontWeight="Bold" />
          <TextBlock x:Name="MemoryValue" Text="--%" FontSize="38" FontWeight="Light" Margin="0,9,0,12" />
          <ProgressBar x:Name="MemoryBar" Maximum="100" Foreground="#00D4FF" />
        </StackPanel>
      </Border>
      <Border Grid.Column="2" Style="{StaticResource Card}">
        <StackPanel>
          <TextBlock Text="DISCO PRINCIPAL" Foreground="{StaticResource Muted}" FontSize="11" FontWeight="Bold" />
          <TextBlock x:Name="DiskValue" Text="--%" FontSize="38" FontWeight="Light" Margin="0,9,0,12" />
          <ProgressBar x:Name="DiskBar" Maximum="100" Foreground="#FF4FA3" />
        </StackPanel>
      </Border>
    </Grid>

    <Grid Grid.Row="2">
      <Grid.ColumnDefinitions><ColumnDefinition Width="1.15*" /><ColumnDefinition Width="0.85*" /></Grid.ColumnDefinitions>
      <Border Grid.Column="0" Style="{StaticResource Card}">
        <Grid>
          <Grid.RowDefinitions><RowDefinition Height="Auto" /><RowDefinition Height="*" /></Grid.RowDefinitions>
          <StackPanel Margin="0,0,0,18">
            <TextBlock Text="IDENTIDADE DA MÁQUINA" FontSize="17" FontWeight="SemiBold" />
            <TextBlock Text="Um retrato instantâneo do seu Windows" Foreground="{StaticResource Muted}" Margin="0,4,0,0" />
          </StackPanel>
          <Grid Grid.Row="1">
            <Grid.ColumnDefinitions><ColumnDefinition /><ColumnDefinition /></Grid.ColumnDefinitions>
            <StackPanel>
              <TextBlock Text="COMPUTADOR" Foreground="{StaticResource Muted}" FontSize="10" />
              <TextBlock x:Name="ComputerName" FontSize="16" Margin="0,3,0,18" TextTrimming="CharacterEllipsis" />
              <TextBlock Text="WINDOWS" Foreground="{StaticResource Muted}" FontSize="10" />
              <TextBlock x:Name="OsName" FontSize="15" Margin="0,3,0,18" TextWrapping="Wrap" />
              <TextBlock Text="TEMPO LIGADO" Foreground="{StaticResource Muted}" FontSize="10" />
              <TextBlock x:Name="Uptime" FontSize="15" Margin="0,3,0,0" />
            </StackPanel>
            <StackPanel Grid.Column="1" Margin="20,0,0,0">
              <TextBlock Text="PROCESSADOR" Foreground="{StaticResource Muted}" FontSize="10" />
              <TextBlock x:Name="CpuName" FontSize="15" Margin="0,3,0,18" TextWrapping="Wrap" />
              <TextBlock Text="ENDEREÇO DE REDE" Foreground="{StaticResource Muted}" FontSize="10" />
              <TextBlock x:Name="IpAddress" FontSize="15" Margin="0,3,0,18" />
              <TextBlock Text="ÚLTIMA LEITURA" Foreground="{StaticResource Muted}" FontSize="10" />
              <TextBlock x:Name="LastUpdate" FontSize="15" Margin="0,3,0,0" />
            </StackPanel>
          </Grid>
        </Grid>
      </Border>

      <Border Grid.Column="1" Style="{StaticResource Card}">
        <Grid>
          <Grid.RowDefinitions><RowDefinition Height="Auto" /><RowDefinition Height="*" /></Grid.RowDefinitions>
          <StackPanel Margin="0,0,0,14">
            <TextBlock Text="MAIORES PROCESSOS" FontSize="17" FontWeight="SemiBold" />
            <TextBlock Text="Consumo atual de memória" Foreground="{StaticResource Muted}" Margin="0,4,0,0" />
          </StackPanel>
          <ListView x:Name="ProcessList" Grid.Row="1" Background="Transparent" BorderThickness="0" Foreground="#E9ECF8" IsHitTestVisible="False">
            <ListView.ItemTemplate>
              <DataTemplate>
                <Grid Margin="0,7">
                  <Grid.ColumnDefinitions><ColumnDefinition /><ColumnDefinition Width="Auto" /></Grid.ColumnDefinitions>
                  <TextBlock Text="{Binding Name}" FontSize="14" />
                  <TextBlock Grid.Column="1" Text="{Binding Memory}" Foreground="#00D4FF" FontWeight="SemiBold" />
                </Grid>
              </DataTemplate>
            </ListView.ItemTemplate>
          </ListView>
        </Grid>
      </Border>
    </Grid>

    <Grid Grid.Row="3" Margin="8,14,8,0">
      <Grid.ColumnDefinitions><ColumnDefinition /><ColumnDefinition Width="Auto" /></Grid.ColumnDefinitions>
      <TextBlock x:Name="StatusText" Text="Monitoramento ativo • atualização a cada 2 segundos" Foreground="{StaticResource Muted}" VerticalAlignment="Center" />
      <Button x:Name="ExportButton" Grid.Column="1" Content="EXPORTAR DIAGNÓSTICO" />
    </Grid>
  </Grid>
</Window>
'@

$reader = [System.Xml.XmlNodeReader]::new([xml]$xaml)
$window = [Windows.Markup.XamlReader]::Load($reader)

function Find-Control([string]$Name) { $window.FindName($Name) }
$controls = @{}
'CpuValue','CpuBar','MemoryValue','MemoryBar','DiskValue','DiskBar','ComputerName','OsName','Uptime','CpuName','IpAddress','LastUpdate','ProcessList','StatusText','ExportButton' | ForEach-Object {
    $controls[$_] = Find-Control $_
}

$os = Get-CimInstance Win32_OperatingSystem
$processor = Get-CimInstance Win32_Processor | Select-Object -First 1
$controls.ComputerName.Text = $env:COMPUTERNAME
$controls.OsName.Text = $os.Caption
$controls.CpuName.Text = $processor.Name.Trim()

function Get-PulseSnapshot {
    $currentOs = Get-CimInstance Win32_OperatingSystem
    $cpu = [math]::Round((Get-CimInstance Win32_Processor | Measure-Object -Property LoadPercentage -Average).Average)
    $memory = [math]::Round((1 - ($currentOs.FreePhysicalMemory / $currentOs.TotalVisibleMemorySize)) * 100)
    $drive = Get-CimInstance Win32_LogicalDisk -Filter "DeviceID='$($env:SystemDrive)'"
    $disk = if ($drive.Size) { [math]::Round((1 - ($drive.FreeSpace / $drive.Size)) * 100) } else { 0 }
    $boot = $currentOs.LastBootUpTime
    $span = (Get-Date) - $boot
    $ip = Get-CimInstance Win32_NetworkAdapterConfiguration -Filter 'IPEnabled=True' |
        ForEach-Object { $_.IPAddress } | Where-Object { $_ -match '^\d{1,3}(\.\d{1,3}){3}$' } | Select-Object -First 1
    [pscustomobject]@{
        Cpu = $cpu; Memory = $memory; Disk = $disk
        Uptime = '{0}d {1}h {2}min' -f $span.Days, $span.Hours, $span.Minutes
        Ip = if ($ip) { $ip } else { 'Não detectado' }
        Updated = Get-Date
    }
}

function Update-Dashboard {
    try {
        $script:snapshot = Get-PulseSnapshot
        $controls.CpuValue.Text = "$($snapshot.Cpu)%"
        $controls.CpuBar.Value = $snapshot.Cpu
        $controls.MemoryValue.Text = "$($snapshot.Memory)%"
        $controls.MemoryBar.Value = $snapshot.Memory
        $controls.DiskValue.Text = "$($snapshot.Disk)%"
        $controls.DiskBar.Value = $snapshot.Disk
        $controls.Uptime.Text = $snapshot.Uptime
        $controls.IpAddress.Text = $snapshot.Ip
        $controls.LastUpdate.Text = $snapshot.Updated.ToString('HH:mm:ss')
        $controls.ProcessList.ItemsSource = @(Get-Process | Sort-Object WorkingSet64 -Descending | Select-Object -First 6 | ForEach-Object {
            [pscustomobject]@{ Name = $_.ProcessName; Memory = '{0:N0} MB' -f ($_.WorkingSet64 / 1MB) }
        })
        $controls.StatusText.Text = 'Monitoramento ativo • atualização a cada 2 segundos'
    } catch {
        $controls.StatusText.Text = "Não foi possível atualizar uma leitura: $($_.Exception.Message)"
    }
}

$controls.ExportButton.Add_Click({
    try {
        Update-Dashboard
        $path = Join-Path ([Environment]::GetFolderPath('Desktop')) ("PulseDeck-{0}.txt" -f (Get-Date -Format 'yyyyMMdd-HHmmss'))
        @"
PULSEDECK — DIAGNÓSTICO DO WINDOWS
Gerado em: $(Get-Date -Format 'dd/MM/yyyy HH:mm:ss')

Computador: $env:COMPUTERNAME
Sistema: $($os.Caption) ($($os.OSArchitecture))
Processador: $($processor.Name.Trim())
CPU em uso: $($snapshot.Cpu)%
Memória em uso: $($snapshot.Memory)%
Disco em uso: $($snapshot.Disk)%
Tempo ligado: $($snapshot.Uptime)
IPv4: $($snapshot.Ip)
"@ | Set-Content -Path $path -Encoding UTF8
        $controls.StatusText.Text = "Relatório salvo em: $path"
    } catch {
        $controls.StatusText.Text = "Falha ao exportar: $($_.Exception.Message)"
    }
})

$timer = [Windows.Threading.DispatcherTimer]::new()
$timer.Interval = [TimeSpan]::FromSeconds(2)
$timer.Add_Tick({ Update-Dashboard })
$window.Add_Closed({ $timer.Stop() })

Update-Dashboard
$timer.Start()
[void]$window.ShowDialog()
