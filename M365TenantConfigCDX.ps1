# Generated with Microsoft365DSC version 1.22.921.1
# For additional information on how to use Microsoft365DSC, please visit https://aka.ms/M365DSC
param (
    [parameter()]
    [System.Management.Automation.PSCredential]
    $Credential
)

Configuration M365TenantConfig
{
    param (
        [parameter()]
        [System.Management.Automation.PSCredential]
        $Credential
    )

    if ($null -eq $Credential)
    {
        <# Credentials #>
        $Credscredential = Get-Credential -Message "Credentials"

    }
    else
    {
        $CredsCredential = $Credential
    }

    $OrganizationName = $CredsCredential.UserName.Split('@')[1]

    Import-DscResource -ModuleName 'Microsoft365DSC' -ModuleVersion '1.22.921.1'

    Node localhost
    {
        AADConditionalAccessPolicy 38ddaa2e-2621-476a-b7e7-4f76bca3d9a4
        {
            ApplicationEnforcedRestrictionsIsEnabled = $False;
            BuiltInControls                          = @();
            ClientAppTypes                           = @("browser","mobileAppsAndDesktopClients");
            CloudAppSecurityIsEnabled                = $True;
            CloudAppSecurityType                     = "mcasConfigured";
            Credential                               = $Credscredential;
            CustomAuthenticationFactors              = @();
            DeviceFilterRule                         = "";
            DisplayName                              = "Office 365 App Control";
            Ensure                                   = "Present";
            ExcludeApplications                      = @();
            ExcludeDevices                           = @();
            ExcludeGroups                            = @();
            ExcludeLocations                         = @();
            ExcludePlatforms                         = @();
            ExcludeRoles                             = @();
            ExcludeUsers                             = @();
            Id                                       = "80cd194b-2695-45d6-b0ce-ca482eaad781";
            IncludeApplications                      = @("00000002-0000-0ff1-ce00-000000000000","00000003-0000-0ff1-ce00-000000000000");
            IncludeDevices                           = @();
            IncludeGroups                            = @();
            IncludeLocations                         = @();
            IncludePlatforms                         = @();
            IncludeRoles                             = @();
            IncludeUserActions                       = @();
            IncludeUsers                             = @("All");
            Managedidentity                          = $False;
            PersistentBrowserIsEnabled               = $False;
            PersistentBrowserMode                    = "";
            SignInFrequencyIsEnabled                 = $False;
            SignInFrequencyType                      = "";
            SignInRiskLevels                         = @();
            State                                    = "disabled";
            UserRiskLevels                           = @();
        }
        AADConditionalAccessPolicy 685ceba5-58ae-476a-8e74-d6403b43e3da
        {
            ApplicationEnforcedRestrictionsIsEnabled = $False;
            BuiltInControls                          = @("compliantDevice");
            ClientAppTypes                           = @("browser","mobileAppsAndDesktopClients");
            CloudAppSecurityIsEnabled                = $False;
            CloudAppSecurityType                     = "";
            Credential                               = $Credscredential;
            CustomAuthenticationFactors              = @();
            DeviceFilterRule                         = "";
            DisplayName                              = "Exchange Online Requires Compliant Device";
            Ensure                                   = "Present";
            ExcludeApplications                      = @();
            ExcludeDevices                           = @();
            ExcludeGroups                            = @();
            ExcludeLocations                         = @();
            ExcludePlatforms                         = @();
            ExcludeRoles                             = @();
            ExcludeUsers                             = @();
            GrantControlOperator                     = "OR";
            Id                                       = "d4a2f17a-699d-4e45-8cc5-33dc16224464";
            IncludeApplications                      = @("00000002-0000-0ff1-ce00-000000000000");
            IncludeDevices                           = @();
            IncludeGroups                            = @("sg-Sales and Marketing");
            IncludeLocations                         = @();
            IncludePlatforms                         = @();
            IncludeRoles                             = @();
            IncludeUserActions                       = @();
            IncludeUsers                             = @();
            Managedidentity                          = $False;
            PersistentBrowserIsEnabled               = $False;
            PersistentBrowserMode                    = "";
            SignInFrequencyIsEnabled                 = $False;
            SignInFrequencyType                      = "";
            SignInRiskLevels                         = @();
            State                                    = "disabled";
            UserRiskLevels                           = @();
        }
        AADGroup df19f538-5a5a-4a31-a3cf-25313a35e2ba
        {
            Credential           = $Credscredential;
            DisplayName          = "All Employees";
            Ensure               = "Present";
            GroupTypes           = @();
            Id                   = "023761f1-9ea6-4115-bd9b-78a1f28dc353";
            MailEnabled          = $True;
            MailNickname         = "Employees";
            Managedidentity      = $False;
            Members              = @("admin@$OrganizationName","AllanD@$OrganizationName","JoniS@$OrganizationName","AlexW@$OrganizationName","PattiF@$OrganizationName","DebraB@$OrganizationName","PradeepG@$OrganizationName","ChristieC@$OrganizationName","NestorW@$OrganizationName","JohannaL@$OrganizationName","IsaiahL@$OrganizationName","MeganB@$OrganizationName","LeeG@$OrganizationName","IrvinS@$OrganizationName","AdeleV@$OrganizationName","LynneR@$OrganizationName","GradyA@$OrganizationName","LidiaH@$OrganizationName","DiegoS@$OrganizationName","MiriamG@$OrganizationName","BrianJ@$OrganizationName");
            Owners               = @();
            SecurityEnabled      = $False;
        }
        AADGroup c62659dc-a2d9-494a-b0d4-99803b8bb57d
        {
            Credential           = $Credscredential;
            DisplayName          = "Project Falcon";
            Ensure               = "Present";
            GroupTypes           = @();
            Id                   = "07ddc3a9-b6b3-40e5-a129-9d4a682f158a";
            MailEnabled          = $True;
            MailNickname         = "Falcon";
            Managedidentity      = $False;
            Members              = @("AlexW@$OrganizationName","MeganB@$OrganizationName","LynneR@$OrganizationName","LidiaH@$OrganizationName");
            Owners               = @();
            SecurityEnabled      = $False;
        }
        AADGroup 1d14da7d-a454-4a98-a987-f921c6be6e0a
        {
            Credential           = $Credscredential;
            Description          = "All executives";
            DisplayName          = "sg-Executive";
            Ensure               = "Present";
            GroupTypes           = @();
            Id                   = "095c4bc7-577f-43b3-b898-36cd804143c5";
            MailEnabled          = $False;
            MailNickname         = "sgExecutive";
            Managedidentity      = $False;
            Members              = @("PattiF@$OrganizationName","GerhartM@$OrganizationName");
            Owners               = @();
            SecurityEnabled      = $True;
        }
        AADGroup 2625dfc6-0e03-4c3a-b041-500c946cda99
        {
            Credential           = $Credscredential;
            Description          = "Self-service password reset enabled users";
            DisplayName          = "SSPRSecurityGroupUsers";
            Ensure               = "Present";
            GroupTypes           = @();
            Id                   = "113e175f-59f4-42a0-91ab-2ea5948fde70";
            MailEnabled          = $False;
            MailNickname         = "SSPRSecurityGroupUsers";
            Managedidentity      = $False;
            Members              = @("RaulR@$OrganizationName","BiancaP@$OrganizationName");
            Owners               = @();
            SecurityEnabled      = $True;
        }
        AADGroup 252a8bc2-7b23-4490-ad99-91b60337b1bc
        {
            Credential           = $Credscredential;
            Description          = "Parents of Contoso";
            DisplayName          = "Parents of Contoso";
            Ensure               = "Present";
            GroupTypes           = @("Unified");
            Id                   = "157e8724-e215-483f-af2b-a4e5c3046e81";
            MailEnabled          = $True;
            MailNickname         = "parentsofcontoso";
            Managedidentity      = $False;
            Members              = @("MeganB@$OrganizationName");
            Owners               = @("MeganB@$OrganizationName");
            SecurityEnabled      = $False;
            Visibility           = "Public";
        }
        AADGroup 2320d93e-9f57-411f-ad05-67c171150279
        {
            Credential           = $Credscredential;
            DisplayName          = "Legal Team";
            Ensure               = "Present";
            GroupTypes           = @();
            Id                   = "2acc9497-f1bf-4da1-b33c-f5af950e8cfa";
            MailEnabled          = $True;
            MailNickname         = "LegalTeam";
            Managedidentity      = $False;
            Members              = @("JoniS@$OrganizationName","GradyA@$OrganizationName");
            Owners               = @();
            SecurityEnabled      = $False;
        }
        AADGroup c7f5e68b-8071-40d8-8a6f-12ea04304f4d
        {
            Credential           = $Credscredential;
            DisplayName          = "Contoso Life";
            Ensure               = "Present";
            GroupTypes           = @("Unified");
            Id                   = "30d0fa69-0018-4350-8163-aa6df3d16933";
            MailEnabled          = $True;
            MailNickname         = "contosolife";
            Managedidentity      = $False;
            Members              = @("MeganB@$OrganizationName");
            Owners               = @("MeganB@$OrganizationName");
            SecurityEnabled      = $False;
            Visibility           = "Public";
        }
        AADGroup 2d529961-5f99-4600-9ebd-50d96aa755bb
        {
            Credential           = $Credscredential;
            DisplayName          = "Contoso";
            Ensure               = "Present";
            GroupTypes           = @("Unified");
            Id                   = "36cbe4e2-acfd-4bac-b71a-a26044e946d2";
            MailEnabled          = $True;
            MailNickname         = "Contoso";
            Managedidentity      = $False;
            Members              = @("admin@$OrganizationName","ms-serviceaccount@$OrganizationName","AllanD@$OrganizationName","JoniS@$OrganizationName","AlexW@$OrganizationName","PattiF@$OrganizationName","DebraB@$OrganizationName","PradeepG@$OrganizationName","ChristieC@$OrganizationName","IsaiahL@$OrganizationName","JohannaL@$OrganizationName","MeganB@$OrganizationName","LeeG@$OrganizationName","IrvinS@$OrganizationName","AdeleV@$OrganizationName","LidiaH@$OrganizationName","LynneR@$OrganizationName","GradyA@$OrganizationName","DiegoS@$OrganizationName","MiriamG@$OrganizationName","CameronW@$OrganizationName","DeliaD@$OrganizationName","GerhartM@$OrganizationName","RaulR@$OrganizationName","BiancaP@$OrganizationName","MalloryC@$OrganizationName","AutomateB@$OrganizationName","BrianJ@$OrganizationName","Adams@$OrganizationName","Baker@$OrganizationName","Crystal@$OrganizationName","Hood@$OrganizationName","Rainier@$OrganizationName","Stevens@$OrganizationName");
            Owners               = @("admin@$OrganizationName","ms-serviceaccount@$OrganizationName","AllanD@$OrganizationName","IsaiahL@$OrganizationName","LidiaH@$OrganizationName");
            SecurityEnabled      = $False;
            Visibility           = "Public";
        }
        AADGroup b25c0e88-b528-48eb-9c83-ec5334d72fc4
        {
            Credential           = $Credscredential;
            Description          = "Share what's on your mind and get important announcements from Patti and the rest of the Leadership Team.";
            DisplayName          = "Leadership";
            Ensure               = "Present";
            GroupTypes           = @("Unified");
            Id                   = "4434ed96-9f18-4f0e-ba60-0f0af34397df";
            MailEnabled          = $True;
            MailNickname         = "leadership";
            Managedidentity      = $False;
            Members              = @("admin@$OrganizationName","AllanD@$OrganizationName","JoniS@$OrganizationName","AlexW@$OrganizationName","PattiF@$OrganizationName","DebraB@$OrganizationName","PradeepG@$OrganizationName","ChristieC@$OrganizationName","IsaiahL@$OrganizationName","NestorW@$OrganizationName","JohannaL@$OrganizationName","MeganB@$OrganizationName","LeeG@$OrganizationName","IrvinS@$OrganizationName","AdeleV@$OrganizationName","LidiaH@$OrganizationName","LynneR@$OrganizationName","GradyA@$OrganizationName","DiegoS@$OrganizationName","MiriamG@$OrganizationName");
            Owners               = @("admin@$OrganizationName","NestorW@$OrganizationName","MeganB@$OrganizationName");
            SecurityEnabled      = $False;
            Visibility           = "Public";
        }
        AADGroup 12c9636b-ebda-4026-b3be-d92ecd6825c3
        {
            Credential           = $Credscredential;
            Description          = "Ask HR";
            DisplayName          = "Ask HR";
            Ensure               = "Present";
            GroupTypes           = @("Unified");
            Id                   = "451a2c70-221e-49f0-82dd-0f38a94b51ca";
            MailEnabled          = $True;
            MailNickname         = "askhr";
            Managedidentity      = $False;
            Members              = @("AllanD@$OrganizationName","JoniS@$OrganizationName","AlexW@$OrganizationName","PattiF@$OrganizationName","DebraB@$OrganizationName","PradeepG@$OrganizationName","ChristieC@$OrganizationName","IsaiahL@$OrganizationName","NestorW@$OrganizationName","JohannaL@$OrganizationName","MeganB@$OrganizationName","LeeG@$OrganizationName","IrvinS@$OrganizationName","AdeleV@$OrganizationName","LidiaH@$OrganizationName","LynneR@$OrganizationName","GradyA@$OrganizationName","DiegoS@$OrganizationName","MiriamG@$OrganizationName");
            Owners               = @("MeganB@$OrganizationName");
            SecurityEnabled      = $False;
            Visibility           = "Public";
        }
        AADGroup a11e9de1-16ad-41da-a679-cd3354d9a8df
        {
            Credential           = $Credscredential;
            Description          = "Office 365 Adoption";
            DisplayName          = "Office 365 Adoption";
            Ensure               = "Present";
            GroupTypes           = @("Unified");
            Id                   = "4cb86925-8c30-4686-a31b-02f732e9dc04";
            MailEnabled          = $True;
            MailNickname         = "office365adoption";
            Managedidentity      = $False;
            Members              = @("MeganB@$OrganizationName");
            Owners               = @("MeganB@$OrganizationName");
            SecurityEnabled      = $False;
            Visibility           = "Public";
        }
        AADGroup 16bd1885-c996-49c9-b806-9b924ae53df2
        {
            Credential           = $Credscredential;
            DisplayName          = "Paralegals";
            Ensure               = "Present";
            GroupTypes           = @();
            Id                   = "4cfb2eec-bf17-4b26-ac19-fcf51984acfd";
            MailEnabled          = $True;
            MailNickname         = "Paralegals";
            Managedidentity      = $False;
            Members              = @("JoniS@$OrganizationName","AlexW@$OrganizationName");
            Owners               = @();
            SecurityEnabled      = $False;
        }
        AADGroup 7dbf4bb7-81cf-4200-afb0-be9e0c81a633
        {
            Credential           = $Credscredential;
            Description          = "Self-service group of employees who wish to participate in welcoming Contoso visitors.";
            DisplayName          = "ssg-Contoso Ambassadors";
            Ensure               = "Present";
            GroupTypes           = @();
            Id                   = "4d7767b3-88ba-4718-bad1-8552c2c66857";
            MailEnabled          = $False;
            MailNickname         = "ssgAmbassadors";
            Managedidentity      = $False;
            Members              = @("PattiF@$OrganizationName","IsaiahL@$OrganizationName","BiancaP@$OrganizationName");
            Owners               = @("PattiF@$OrganizationName");
            SecurityEnabled      = $True;
        }
        AADGroup 4919d6b6-5dfa-4ed4-ab12-db1a1761fdab
        {
            Credential           = $Credscredential;
            Description          = "A collaboration area for the Contoso Team.";
            DisplayName          = "Contoso Team";
            Ensure               = "Present";
            GroupTypes           = @("Unified");
            Id                   = "52c1eec4-b8f6-471e-9eda-2c9c72ea4a20";
            MailEnabled          = $True;
            MailNickname         = "contosoteam";
            Managedidentity      = $False;
            Members              = @("admin@$OrganizationName","JoniS@$OrganizationName","AlexW@$OrganizationName","PattiF@$OrganizationName","DebraB@$OrganizationName","PradeepG@$OrganizationName","ChristieC@$OrganizationName","IsaiahL@$OrganizationName","NestorW@$OrganizationName","JohannaL@$OrganizationName","MeganB@$OrganizationName","LeeG@$OrganizationName","AdeleV@$OrganizationName","LidiaH@$OrganizationName","LynneR@$OrganizationName","GradyA@$OrganizationName","DiegoS@$OrganizationName","MiriamG@$OrganizationName");
            Owners               = @("admin@$OrganizationName","MeganB@$OrganizationName");
            SecurityEnabled      = $True;
            Visibility           = "Private";
        }
        AADGroup cb7bfee9-83c4-4b28-8f2b-b42ad54b6ce2
        {
            Credential           = $Credscredential;
            Description          = "Retail";
            DisplayName          = "Retail";
            Ensure               = "Present";
            GroupTypes           = @("Unified");
            Id                   = "55e10195-eaa1-4490-9112-29cfd5eeb2da";
            MailEnabled          = $True;
            MailNickname         = "Retail";
            Managedidentity      = $False;
            Members              = @("admin@$OrganizationName","JoniS@$OrganizationName","AlexW@$OrganizationName","PattiF@$OrganizationName","DebraB@$OrganizationName","PradeepG@$OrganizationName","ChristieC@$OrganizationName","IsaiahL@$OrganizationName","NestorW@$OrganizationName","JohannaL@$OrganizationName","MeganB@$OrganizationName","LeeG@$OrganizationName","IrvinS@$OrganizationName","AdeleV@$OrganizationName","LidiaH@$OrganizationName","LynneR@$OrganizationName","GradyA@$OrganizationName","DiegoS@$OrganizationName","MiriamG@$OrganizationName");
            Owners               = @("admin@$OrganizationName","NestorW@$OrganizationName","MeganB@$OrganizationName");
            SecurityEnabled      = $True;
            Visibility           = "Private";
        }
        AADGroup 0be66aac-2cd4-4352-a8dd-14524b343d82
        {
            Credential           = $Credscredential;
            Description          = "All marketing personnel";
            DisplayName          = "sg-Sales and Marketing";
            Ensure               = "Present";
            GroupTypes           = @();
            Id                   = "56ff8a04-e652-43b3-9769-684a599984f8";
            MailEnabled          = $False;
            MailNickname         = "sgSalesandMarketing";
            Managedidentity      = $False;
            Members              = @("AlexW@$OrganizationName","ChristieC@$OrganizationName","IsaiahL@$OrganizationName","AdeleV@$OrganizationName","LidiaH@$OrganizationName","LynneR@$OrganizationName","MiriamG@$OrganizationName","BiancaP@$OrganizationName");
            Owners               = @();
            SecurityEnabled      = $True;
        }
        AADGroup de7516fb-01fa-41ab-b731-dd245ff0be22
        {
            Credential           = $Credscredential;
            Description          = "All operations personnel";
            DisplayName          = "sg-Operations";
            Ensure               = "Present";
            GroupTypes           = @();
            Id                   = "66b4a91d-24a2-4021-8725-584d9cb30928";
            MailEnabled          = $False;
            MailNickname         = "sgOperations";
            Managedidentity      = $False;
            Members              = @("AllanD@$OrganizationName","NestorW@$OrganizationName");
            Owners               = @();
            SecurityEnabled      = $True;
        }
        AADGroup bca96075-229b-4433-a479-ebe811694aba
        {
            Credential           = $Credscredential;
            Description          = "Sales and Marketing";
            DisplayName          = "Sales and Marketing";
            Ensure               = "Present";
            GroupTypes           = @("Unified");
            Id                   = "6e516149-aeee-49bb-8c11-2780ca75dfb0";
            MailEnabled          = $True;
            MailNickname         = "SalesAndMarketing";
            Managedidentity      = $False;
            Members              = @("admin@$OrganizationName","AllanD@$OrganizationName","JoniS@$OrganizationName","AlexW@$OrganizationName","PattiF@$OrganizationName","DebraB@$OrganizationName","PradeepG@$OrganizationName","ChristieC@$OrganizationName","IsaiahL@$OrganizationName","NestorW@$OrganizationName","JohannaL@$OrganizationName","MeganB@$OrganizationName","LeeG@$OrganizationName","IrvinS@$OrganizationName","AdeleV@$OrganizationName","LidiaH@$OrganizationName","LynneR@$OrganizationName","GradyA@$OrganizationName","DiegoS@$OrganizationName","MiriamG@$OrganizationName");
            Owners               = @("admin@$OrganizationName","IsaiahL@$OrganizationName","NestorW@$OrganizationName","JohannaL@$OrganizationName","MeganB@$OrganizationName","MiriamG@$OrganizationName");
            SecurityEnabled      = $True;
            Visibility           = "Public";
        }
        AADGroup 67385f17-5188-4388-8675-40401b554b6c
        {
            Credential           = $Credscredential;
            DisplayName          = "Tailspin Toys";
            Ensure               = "Present";
            GroupTypes           = @();
            Id                   = "6ed39b79-eb68-4446-a34f-43ce24081bc7";
            MailEnabled          = $True;
            MailNickname         = "Tailspin";
            Managedidentity      = $False;
            Members              = @("AlexW@$OrganizationName","MeganB@$OrganizationName","LidiaH@$OrganizationName","LynneR@$OrganizationName");
            Owners               = @();
            SecurityEnabled      = $False;
        }
        AADGroup 07033ef0-b3d4-4575-a0b9-7827719651d9
        {
            Credential           = $Credscredential;
            DisplayName          = "Sales Team";
            Ensure               = "Present";
            GroupTypes           = @();
            Id                   = "6f427395-7db7-4c1f-9c3d-f00e1d911191";
            MailEnabled          = $True;
            MailNickname         = "SalesTeam";
            Managedidentity      = $False;
            Members              = @("AlexW@$OrganizationName","ChristieC@$OrganizationName","IsaiahL@$OrganizationName","MeganB@$OrganizationName","LynneR@$OrganizationName","MiriamG@$OrganizationName");
            Owners               = @();
            SecurityEnabled      = $False;
        }
        AADGroup 5130bf07-a6ab-4f81-a22e-0703f39d8cfe
        {
            Credential           = $Credscredential;
            Description          = "Sales Planning";
            DisplayName          = "Sales Planning";
            Ensure               = "Present";
            GroupTypes           = @("Unified");
            Id                   = "7086ed4c-450e-4eed-b4df-47c39b20ba62";
            MailEnabled          = $True;
            MailNickname         = "SalesPlanning";
            Managedidentity      = $False;
            Members              = @("AllanD@$OrganizationName","AlexW@$OrganizationName","ChristieC@$OrganizationName","IsaiahL@$OrganizationName","IrvinS@$OrganizationName","LidiaH@$OrganizationName","LynneR@$OrganizationName","DiegoS@$OrganizationName");
            Owners               = @("LidiaH@$OrganizationName");
            SecurityEnabled      = $False;
            Visibility           = "Private";
        }
        AADGroup 7f07322c-1c3b-4a83-b13a-a8f520a2e03d
        {
            Credential           = $Credscredential;
            DisplayName          = "Finance Team";
            Ensure               = "Present";
            GroupTypes           = @();
            Id                   = "759e4e54-636f-4b4a-8b5a-262f4d19342b";
            MailEnabled          = $True;
            MailNickname         = "FinanceTeam";
            Managedidentity      = $False;
            Members              = @("DebraB@$OrganizationName","PradeepG@$OrganizationName","MeganB@$OrganizationName","LynneR@$OrganizationName","DiegoS@$OrganizationName");
            Owners               = @();
            SecurityEnabled      = $False;
        }
        AADGroup 5c749f96-49d5-48fd-b4d0-f43c7f2e5b42
        {
            Credential           = $Credscredential;
            Description          = "All retail Users";
            DisplayName          = "sg-Retail";
            Ensure               = "Present";
            GroupTypes           = @();
            Id                   = "77289759-ac99-441d-8231-6939a1f592d1";
            MailEnabled          = $False;
            MailNickname         = "sgRetail";
            Managedidentity      = $False;
            Members              = @("CameronW@$OrganizationName");
            Owners               = @();
            SecurityEnabled      = $True;
        }
        AADGroup 3a8277c5-39bf-4d61-95ea-950c8a08d0a1
        {
            Credential           = $Credscredential;
            Description          = "All HR personnel";
            DisplayName          = "sg-HR";
            Ensure               = "Present";
            GroupTypes           = @();
            Id                   = "80c4c3c1-925d-47e6-8b7d-fa54271dabf8";
            MailEnabled          = $False;
            MailNickname         = "sgHR";
            Managedidentity      = $False;
            Members              = @();
            Owners               = @();
            SecurityEnabled      = $True;
        }
        AADGroup 764593f7-677a-48c7-bd00-bc07d3c4ec1a
        {
            Credential           = $Credscredential;
            Description          = "This is the default group for everyone in the network";
            DisplayName          = "All Company";
            Ensure               = "Present";
            GroupTypes           = @("Unified");
            Id                   = "9f6b6473-055a-44f4-b4e7-c5be9b19f69a";
            MailEnabled          = $True;
            MailNickname         = "allcompany";
            Managedidentity      = $False;
            Members              = @("admin@$OrganizationName");
            Owners               = @("admin@$OrganizationName");
            SecurityEnabled      = $False;
            Visibility           = "Public";
        }
        AADGroup 8993ec43-910e-4716-80dd-f0cf843ac4c0
        {
            Credential           = $Credscredential;
            DisplayName          = "Executives";
            Ensure               = "Present";
            GroupTypes           = @();
            Id                   = "a5ef4832-7847-4ee2-b1d4-9227c28c4be7";
            MailEnabled          = $True;
            MailNickname         = "Executives";
            Managedidentity      = $False;
            Members              = @("PattiF@$OrganizationName");
            Owners               = @();
            SecurityEnabled      = $False;
        }
        AADGroup 0e8e97e8-9833-4b09-94b8-6f7aa72f5369
        {
            Credential           = $Credscredential;
            Description          = "bla bla";
            DisplayName          = "PAMApprovers";
            Ensure               = "Present";
            GroupTypes           = @();
            Id                   = "a62dc56f-dbd8-4738-b459-ab16e85b52d6";
            MailEnabled          = $True;
            MailNickname         = "PAM";
            Managedidentity      = $False;
            Members              = @();
            Owners               = @();
            SecurityEnabled      = $True;
        }
        AADGroup c325fa47-aaa5-45a8-aab1-008b6dfb6693
        {
            Credential           = $Credscredential;
            DisplayName          = "Northwind Traders";
            Ensure               = "Present";
            GroupTypes           = @();
            Id                   = "aeb2dc8a-c66c-416e-9bba-8948d7b204a9";
            MailEnabled          = $True;
            MailNickname         = "Traders";
            Managedidentity      = $False;
            Members              = @("AlexW@$OrganizationName","MeganB@$OrganizationName","LidiaH@$OrganizationName","LynneR@$OrganizationName");
            Owners               = @();
            SecurityEnabled      = $False;
        }
        AADGroup ec22f183-17b9-4647-b595-aad7505e2452
        {
            Credential           = $Credscredential;
            Description          = "All finance personnel";
            DisplayName          = "sg-Finance";
            Ensure               = "Present";
            GroupTypes           = @();
            Id                   = "af59e1d3-438d-40b6-8915-161516cbdf02";
            MailEnabled          = $False;
            MailNickname         = "sgFinance";
            Managedidentity      = $False;
            Members              = @("DebraB@$OrganizationName","PradeepG@$OrganizationName","MeganB@$OrganizationName","DiegoS@$OrganizationName");
            Owners               = @();
            SecurityEnabled      = $True;
        }
        AADGroup 2f362854-90db-445a-84c6-3b9f92b0da77
        {
            Credential           = $Credscredential;
            Description          = "Mark 8 Project Team";
            DisplayName          = "Mark 8 Project Team";
            Ensure               = "Present";
            GroupTypes           = @("Unified");
            Id                   = "b8e36a39-bd61-441e-8bca-1862aa22768b";
            MailEnabled          = $True;
            MailNickname         = "Mark8ProjectTeam";
            Managedidentity      = $False;
            Members              = @("admin@$OrganizationName","JoniS@$OrganizationName","AlexW@$OrganizationName","PattiF@$OrganizationName","DebraB@$OrganizationName","PradeepG@$OrganizationName","ChristieC@$OrganizationName","IsaiahL@$OrganizationName","NestorW@$OrganizationName","JohannaL@$OrganizationName","MeganB@$OrganizationName","LeeG@$OrganizationName","IrvinS@$OrganizationName","AdeleV@$OrganizationName","LidiaH@$OrganizationName","LynneR@$OrganizationName","GradyA@$OrganizationName","DiegoS@$OrganizationName","MiriamG@$OrganizationName");
            Owners               = @("admin@$OrganizationName","NestorW@$OrganizationName","MeganB@$OrganizationName");
            SecurityEnabled      = $True;
            Visibility           = "Public";
        }
        AADGroup 0e109af1-ceda-4979-88fe-51eafcdd953d
        {
            Credential           = $Credscredential;
            Description          = "Sales Best Practices";
            DisplayName          = "Sales Best Practices";
            Ensure               = "Present";
            GroupTypes           = @("Unified");
            Id                   = "bafec7a3-c9a5-45a1-aac1-989b8ee2b748";
            MailEnabled          = $True;
            MailNickname         = "salesbestpractices";
            Managedidentity      = $False;
            Members              = @("AllanD@$OrganizationName","JoniS@$OrganizationName","AlexW@$OrganizationName","PattiF@$OrganizationName","DebraB@$OrganizationName","PradeepG@$OrganizationName","ChristieC@$OrganizationName","IsaiahL@$OrganizationName","NestorW@$OrganizationName","JohannaL@$OrganizationName","MeganB@$OrganizationName","LeeG@$OrganizationName","IrvinS@$OrganizationName","AdeleV@$OrganizationName","LidiaH@$OrganizationName","LynneR@$OrganizationName","GradyA@$OrganizationName","DiegoS@$OrganizationName","MiriamG@$OrganizationName");
            Owners               = @("MeganB@$OrganizationName");
            SecurityEnabled      = $False;
            Visibility           = "Public";
        }
        AADGroup bf851cc7-fe3e-420d-aa9a-3f11bfad7d4d
        {
            Credential           = $Credscredential;
            Description          = "U.S. Sales";
            DisplayName          = "U.S. Sales";
            Ensure               = "Present";
            GroupTypes           = @("Unified");
            Id                   = "be727aab-b4a7-4e19-b862-d2937a5150b3";
            MailEnabled          = $True;
            MailNickname         = "USSales";
            Managedidentity      = $False;
            Members              = @("admin@$OrganizationName","AlexW@$OrganizationName","IsaiahL@$OrganizationName","MeganB@$OrganizationName","IrvinS@$OrganizationName","AdeleV@$OrganizationName","LynneR@$OrganizationName");
            Owners               = @("admin@$OrganizationName","IsaiahL@$OrganizationName","MeganB@$OrganizationName");
            SecurityEnabled      = $True;
            Visibility           = "Private";
        }
        AADGroup 5906c2ad-5055-45ac-8300-aeef6616d494
        {
            Credential           = $Credscredential;
            Description          = "Share what's on your mind and get important operations announcements.";
            DisplayName          = "Operations";
            Ensure               = "Present";
            GroupTypes           = @("Unified");
            Id                   = "cf8a4e61-984e-4cb2-8dab-d314bcf2bef9";
            MailEnabled          = $True;
            MailNickname         = "operations";
            Managedidentity      = $False;
            Members              = @("AllanD@$OrganizationName","JoniS@$OrganizationName","AlexW@$OrganizationName","PattiF@$OrganizationName","DebraB@$OrganizationName","PradeepG@$OrganizationName","ChristieC@$OrganizationName","IsaiahL@$OrganizationName","NestorW@$OrganizationName","JohannaL@$OrganizationName","MeganB@$OrganizationName","LeeG@$OrganizationName","IrvinS@$OrganizationName","AdeleV@$OrganizationName","LidiaH@$OrganizationName","LynneR@$OrganizationName","GradyA@$OrganizationName","DiegoS@$OrganizationName","MiriamG@$OrganizationName");
            Owners               = @("MeganB@$OrganizationName");
            SecurityEnabled      = $False;
            Visibility           = "Public";
        }
        AADGroup b87f8779-0e38-47b6-9a2b-ddc2d0a7923c
        {
            Credential           = $Credscredential;
            Description          = "Safety";
            DisplayName          = "Safety";
            Ensure               = "Present";
            GroupTypes           = @("Unified");
            Id                   = "d53f7885-feb2-47b3-a87d-9fab53f92d93";
            MailEnabled          = $True;
            MailNickname         = "safety";
            Managedidentity      = $False;
            Members              = @("MeganB@$OrganizationName");
            Owners               = @("MeganB@$OrganizationName");
            SecurityEnabled      = $False;
            Visibility           = "Public";
        }
        AADGroup 06f46ba1-9423-4192-b732-20e4cb8cc386
        {
            Credential           = $Credscredential;
            Description          = "Self-service group of employees who wish to provide feedback on early-release Contoso software.";
            DisplayName          = "ssg-Contoso Bug Bashers";
            Ensure               = "Present";
            GroupTypes           = @();
            Id                   = "ddc96bd2-0c01-42df-b9b2-e878b51d15f9";
            MailEnabled          = $False;
            MailNickname         = "ssgBugBashers";
            Managedidentity      = $False;
            Members              = @("PattiF@$OrganizationName","RaulR@$OrganizationName","BiancaP@$OrganizationName");
            Owners               = @("PattiF@$OrganizationName");
            SecurityEnabled      = $True;
        }
        AADGroup 5a324735-43ba-43e6-8f10-59774ba40489
        {
            Credential           = $Credscredential;
            Description          = "SOC Team";
            DisplayName          = "SOC Team";
            Ensure               = "Present";
            GroupTypes           = @("Unified");
            Id                   = "de608986-7d00-4a54-b009-07bd0f37ac1a";
            MailEnabled          = $True;
            MailNickname         = "SOCTeam";
            Managedidentity      = $False;
            Members              = @("admin@$OrganizationName","AllanD@$OrganizationName","IsaiahL@$OrganizationName","NestorW@$OrganizationName","MeganB@$OrganizationName","LidiaH@$OrganizationName");
            Owners               = @("admin@$OrganizationName","AllanD@$OrganizationName","MeganB@$OrganizationName");
            SecurityEnabled      = $False;
            Visibility           = "Private";
        }
        AADGroup c117826e-6ef3-4dbf-bc09-2dcbe66497e6
        {
            Credential           = $Credscredential;
            Description          = "Contribute your ideas and ask your questions to our leadership team. And tune in for regular Employee Q & A live events. You can learn more about what";
            DisplayName          = "CEO Connection";
            Ensure               = "Present";
            GroupTypes           = @("Unified");
            Id                   = "e7350a99-ed8c-4c19-a6b0-a600c32e7f04";
            MailEnabled          = $True;
            MailNickname         = "ceoconnection";
            Managedidentity      = $False;
            Members              = @("AllanD@$OrganizationName","JoniS@$OrganizationName","AlexW@$OrganizationName","PattiF@$OrganizationName","DebraB@$OrganizationName","PradeepG@$OrganizationName","ChristieC@$OrganizationName","IsaiahL@$OrganizationName","NestorW@$OrganizationName","JohannaL@$OrganizationName","MeganB@$OrganizationName","LeeG@$OrganizationName","IrvinS@$OrganizationName","AdeleV@$OrganizationName","LidiaH@$OrganizationName","LynneR@$OrganizationName","GradyA@$OrganizationName","DiegoS@$OrganizationName","MiriamG@$OrganizationName");
            Owners               = @("MeganB@$OrganizationName");
            SecurityEnabled      = $False;
            Visibility           = "Public";
        }
        AADGroup 8fabee59-0bf0-46aa-8db6-d253e26c7ee9
        {
            Credential           = $Credscredential;
            Description          = "All IT personnel";
            DisplayName          = "sg-IT";
            Ensure               = "Present";
            GroupTypes           = @();
            Id                   = "eef9868e-7c63-4c11-bc29-d4665f2c8c3b";
            MailEnabled          = $False;
            MailNickname         = "sgIT";
            Managedidentity      = $False;
            Members              = @("admin@$OrganizationName");
            Owners               = @();
            SecurityEnabled      = $True;
        }
        AADGroup de08f73d-053b-4726-a8b7-97c726d1763b
        {
            Credential           = $Credscredential;
            Description          = "Records Management Admins";
            DisplayName          = "Records Management Admins";
            Ensure               = "Present";
            GroupTypes           = @("Unified");
            Id                   = "f3bb018f-b568-4b6c-98ce-c246f6f8bea4";
            MailEnabled          = $True;
            MailNickname         = "RecordsManagementAdmins";
            Managedidentity      = $False;
            Members              = @("admin@$OrganizationName","NestorW@$OrganizationName","JohannaL@$OrganizationName","MeganB@$OrganizationName");
            Owners               = @("admin@$OrganizationName","NestorW@$OrganizationName","JohannaL@$OrganizationName","MeganB@$OrganizationName");
            SecurityEnabled      = $True;
            Visibility           = "Private";
        }
        AADGroup e59323ea-6b89-46c8-882f-5f2e75ac2f7c
        {
            Credential           = $Credscredential;
            Description          = "Digital Initiative Public Relations";
            DisplayName          = "Digital Initiative Public Relations";
            Ensure               = "Present";
            GroupTypes           = @("Unified");
            Id                   = "f939de6c-9ab0-414e-b525-f2c0a196c1ff";
            MailEnabled          = $True;
            MailNickname         = "DigitalInitiativePublicRelations";
            Managedidentity      = $False;
            Members              = @("admin@$OrganizationName","AllanD@$OrganizationName","JoniS@$OrganizationName","AlexW@$OrganizationName","PattiF@$OrganizationName","DebraB@$OrganizationName","PradeepG@$OrganizationName","ChristieC@$OrganizationName","IsaiahL@$OrganizationName","NestorW@$OrganizationName","JohannaL@$OrganizationName","MeganB@$OrganizationName","LeeG@$OrganizationName","IrvinS@$OrganizationName","AdeleV@$OrganizationName","LidiaH@$OrganizationName","LynneR@$OrganizationName","GradyA@$OrganizationName","DiegoS@$OrganizationName","MiriamG@$OrganizationName");
            Owners               = @("admin@$OrganizationName","MeganB@$OrganizationName","MiriamG@$OrganizationName");
            SecurityEnabled      = $True;
            Visibility           = "Private";
        }
        AADGroup a7ebf0a9-ce8c-401c-9d89-86d2f2f55926
        {
            Credential           = $Credscredential;
            Description          = "New Employee Onboarding";
            DisplayName          = "New Employee Onboarding";
            Ensure               = "Present";
            GroupTypes           = @("Unified");
            Id                   = "fac40793-fd24-42d1-b8a5-aafe223d6ae5";
            MailEnabled          = $True;
            MailNickname         = "newemployeeonboarding";
            Managedidentity      = $False;
            Members              = @("MeganB@$OrganizationName");
            Owners               = @("MeganB@$OrganizationName");
            SecurityEnabled      = $False;
            Visibility           = "Public";
        }
        AADGroup 6d00f16e-cc4a-4e7f-a8b3-31c9f01317b7
        {
            Credential           = $Credscredential;
            Description          = "All legal executives";
            DisplayName          = "sg-Legal";
            Ensure               = "Present";
            GroupTypes           = @();
            Id                   = "fd2c628d-320f-46c5-91c0-8113c8837978";
            MailEnabled          = $False;
            MailNickname         = "sgLegal";
            Managedidentity      = $False;
            Members              = @("JoniS@$OrganizationName","IrvinS@$OrganizationName","GradyA@$OrganizationName");
            Owners               = @();
            SecurityEnabled      = $True;
        }
        AADGroup 0fdb859a-d37e-405c-b282-594d2de5f2ca
        {
            Credential           = $Credscredential;
            Description          = "All engineering personnel";
            DisplayName          = "sg-Engineering";
            Ensure               = "Present";
            GroupTypes           = @();
            Id                   = "fde54f45-f8f4-48b1-8953-589e125acf37";
            MailEnabled          = $False;
            MailNickname         = "sgEngineering";
            Managedidentity      = $False;
            Members              = @("JohannaL@$OrganizationName","LeeG@$OrganizationName","DeliaD@$OrganizationName","RaulR@$OrganizationName");
            Owners               = @();
            SecurityEnabled      = $True;
        }
        AADRoleDefinition f472d89a-d51d-408b-9da1-7c36cbd9f07c
        {
            Credential           = $Credscredential;
            Description          = "Can manage all aspects of Azure AD and Microsoft services that use Azure AD identities.";
            DisplayName          = "Global Administrator";
            Ensure               = "Present";
            Id                   = "62e90394-69f5-4237-9190-012177145e10";
            IsEnabled            = $True;
            Managedidentity      = $False;
            ResourceScopes       = @("/");
            RolePermissions      = @("microsoft.directory/accessReviews/allProperties/allTasks","microsoft.directory/accessReviews/definitions/allProperties/allTasks","microsoft.directory/adminConsentRequestPolicy/allProperties/allTasks","microsoft.directory/administrativeUnits/allProperties/allTasks","microsoft.directory/appConsent/appConsentRequests/allProperties/read","microsoft.directory/applications/allProperties/allTasks","microsoft.directory/applications/synchronization/standard/read","microsoft.directory/applicationTemplates/instantiate","microsoft.directory/auditLogs/allProperties/read","microsoft.directory/users/authenticationMethods/create","microsoft.directory/users/authenticationMethods/delete","microsoft.directory/users/authenticationMethods/standard/read","microsoft.directory/users/authenticationMethods/basic/update","microsoft.directory/authorizationPolicy/allProperties/allTasks","microsoft.directory/bitlockerKeys/key/read","microsoft.directory/cloudAppSecurity/allProperties/allTasks","microsoft.directory/connectors/create","microsoft.directory/connectors/allProperties/read","microsoft.directory/connectorGroups/create","microsoft.directory/connectorGroups/delete","microsoft.directory/connectorGroups/allProperties/read","microsoft.directory/connectorGroups/allProperties/update","microsoft.directory/contacts/allProperties/allTasks","microsoft.directory/contracts/allProperties/allTasks","microsoft.directory/customAuthenticationExtensions/allProperties/allTasks","microsoft.directory/deletedItems/delete","microsoft.directory/deletedItems/restore","microsoft.directory/devices/allProperties/allTasks","microsoft.directory/namedLocations/create","microsoft.directory/namedLocations/delete","microsoft.directory/namedLocations/standard/read","microsoft.directory/namedLocations/basic/update","microsoft.directory/deviceManagementPolicies/standard/read","microsoft.directory/deviceManagementPolicies/basic/update","microsoft.directory/deviceRegistrationPolicy/standard/read","microsoft.directory/deviceRegistrationPolicy/basic/update","microsoft.directory/directoryRoles/allProperties/allTasks","microsoft.directory/directoryRoleTemplates/allProperties/allTasks","microsoft.directory/domains/allProperties/allTasks","microsoft.directory/entitlementManagement/allProperties/allTasks","microsoft.directory/groups/allProperties/allTasks","microsoft.directory/groupsAssignableToRoles/create","microsoft.directory/groupsAssignableToRoles/delete","microsoft.directory/groupsAssignableToRoles/restore","microsoft.directory/groupsAssignableToRoles/allProperties/update","microsoft.directory/groupSettings/allProperties/allTasks","microsoft.directory/groupSettingTemplates/allProperties/allTasks","microsoft.directory/hybridAuthenticationPolicy/allProperties/allTasks","microsoft.directory/identityProtection/allProperties/allTasks","microsoft.directory/loginOrganizationBranding/allProperties/allTasks","microsoft.directory/oAuth2PermissionGrants/allProperties/allTasks","microsoft.directory/organization/allProperties/allTasks","microsoft.directory/passwordHashSync/allProperties/allTasks","microsoft.directory/policies/allProperties/allTasks","microsoft.directory/conditionalAccessPolicies/allProperties/allTasks","microsoft.directory/crossTenantAccessPolicy/standard/read","microsoft.directory/crossTenantAccessPolicy/allowedCloudEndpoints/update","microsoft.directory/crossTenantAccessPolicy/basic/update","microsoft.directory/crossTenantAccessPolicy/default/standard/read","microsoft.directory/crossTenantAccessPolicy/default/b2bCollaboration/update","microsoft.directory/crossTenantAccessPolicy/default/b2bDirectConnect/update","microsoft.directory/crossTenantAccessPolicy/default/crossCloudMeetings/update","microsoft.directory/crossTenantAccessPolicy/default/tenantRestrictions/update","microsoft.directory/crossTenantAccessPolicy/partners/create","microsoft.directory/crossTenantAccessPolicy/partners/delete","microsoft.directory/crossTenantAccessPolicy/partners/standard/read","microsoft.directory/crossTenantAccessPolicy/partners/b2bCollaboration/update","microsoft.directory/crossTenantAccessPolicy/partners/b2bDirectConnect/update","microsoft.directory/crossTenantAccessPolicy/partners/crossCloudMeetings/update","microsoft.directory/crossTenantAccessPolicy/partners/tenantRestrictions/update","microsoft.directory/privilegedIdentityManagement/allProperties/read","microsoft.directory/provisioningLogs/allProperties/read","microsoft.directory/resourceNamespaces/resourceActions/authenticationContext/update","microsoft.directory/roleAssignments/allProperties/allTasks","microsoft.directory/roleDefinitions/allProperties/allTasks","microsoft.directory/scopedRoleMemberships/allProperties/allTasks","microsoft.directory/serviceAction/activateService","microsoft.directory/serviceAction/disableDirectoryFeature","microsoft.directory/serviceAction/enableDirectoryFeature","microsoft.directory/serviceAction/getAvailableExtentionProperties","microsoft.directory/servicePrincipals/allProperties/allTasks","microsoft.directory/servicePrincipals/managePermissionGrantsForAll.microsoft-company-admin","microsoft.directory/servicePrincipals/synchronization/standard/read","microsoft.directory/signInReports/allProperties/read","microsoft.directory/subscribedSkus/allProperties/allTasks","microsoft.directory/users/allProperties/allTasks","microsoft.directory/permissionGrantPolicies/create","microsoft.directory/permissionGrantPolicies/delete","microsoft.directory/permissionGrantPolicies/standard/read","microsoft.directory/permissionGrantPolicies/basic/update","microsoft.directory/servicePrincipalCreationPolicies/create","microsoft.directory/servicePrincipalCreationPolicies/delete","microsoft.directory/servicePrincipalCreationPolicies/standard/read","microsoft.directory/servicePrincipalCreationPolicies/basic/update","microsoft.directory/tenantManagement/tenants/create","microsoft.directory/verifiableCredentials/configuration/contracts/cards/allProperties/read","microsoft.directory/verifiableCredentials/configuration/contracts/cards/revoke","microsoft.directory/verifiableCredentials/configuration/contracts/create","microsoft.directory/verifiableCredentials/configuration/contracts/allProperties/read","microsoft.directory/verifiableCredentials/configuration/contracts/allProperties/update","microsoft.directory/verifiableCredentials/configuration/create","microsoft.directory/verifiableCredentials/configuration/delete","microsoft.directory/verifiableCredentials/configuration/allProperties/read","microsoft.directory/verifiableCredentials/configuration/allProperties/update","microsoft.directory/lifecycleWorkflows/workflows/allProperties/allTasks","microsoft.azure.advancedThreatProtection/allEntities/allTasks","microsoft.azure.informationProtection/allEntities/allTasks","microsoft.azure.serviceHealth/allEntities/allTasks","microsoft.azure.supportTickets/allEntities/allTasks","microsoft.cloudPC/allEntities/allProperties/allTasks","microsoft.commerce.billing/allEntities/allProperties/allTasks","microsoft.commerce.billing/purchases/standard/read","microsoft.dynamics365/allEntities/allTasks","microsoft.edge/allEntities/allProperties/allTasks","microsoft.flow/allEntities/allTasks","microsoft.hardware.support/shippingAddress/allProperties/allTasks","microsoft.hardware.support/shippingStatus/allProperties/read","microsoft.hardware.support/warrantyClaims/allProperties/allTasks","microsoft.insights/allEntities/allProperties/allTasks","microsoft.intune/allEntities/allTasks","microsoft.office365.complianceManager/allEntities/allTasks","microsoft.office365.desktopAnalytics/allEntities/allTasks","microsoft.office365.exchange/allEntities/basic/allTasks","microsoft.office365.knowledge/contentUnderstanding/allProperties/allTasks","microsoft.office365.knowledge/contentUnderstanding/analytics/allProperties/read","microsoft.office365.knowledge/knowledgeNetwork/allProperties/allTasks","microsoft.office365.knowledge/knowledgeNetwork/topicVisibility/allProperties/allTasks","microsoft.office365.knowledge/learningSources/allProperties/allTasks","microsoft.office365.lockbox/allEntities/allTasks","microsoft.office365.messageCenter/messages/read","microsoft.office365.messageCenter/securityMessages/read","microsoft.office365.network/performance/allProperties/read","microsoft.office365.organizationalMessages/allEntities/allProperties/allTasks","microsoft.office365.protectionCenter/allEntities/allProperties/allTasks","microsoft.office365.search/content/manage","microsoft.office365.securityComplianceCenter/allEntities/allTasks","microsoft.office365.serviceHealth/allEntities/allTasks","microsoft.office365.sharePoint/allEntities/allTasks","microsoft.office365.skypeForBusiness/allEntities/allTasks","microsoft.office365.supportTickets/allEntities/allTasks","microsoft.office365.usageReports/allEntities/allProperties/read","microsoft.office365.userCommunication/allEntities/allTasks","microsoft.office365.webPortal/allEntities/standard/read","microsoft.office365.yammer/allEntities/allProperties/allTasks","microsoft.permissionsManagement/allEntities/allProperties/allTasks","microsoft.powerApps/allEntities/allTasks","microsoft.powerApps.powerBI/allEntities/allTasks","microsoft.teams/allEntities/allProperties/allTasks","microsoft.virtualVisits/allEntities/allProperties/allTasks","microsoft.windows.defenderAdvancedThreatProtection/allEntities/allTasks","microsoft.windows.updatesDeployments/allEntities/allProperties/allTasks");
            TemplateId           = "62e90394-69f5-4237-9190-012177145e10";
            Version              = "1";
        }
        AADRoleDefinition df8e09da-6a25-46e9-9fad-4e9aad4a583b
        {
            Credential           = $Credscredential;
            Description          = "Default role for guest users. Can read a limited set of directory information.";
            DisplayName          = "Guest User";
            Ensure               = "Present";
            Id                   = "10dae51f-b6af-4016-8d66-8c2a99b929b3";
            IsEnabled            = $True;
            Managedidentity      = $False;
            ResourceScopes       = @("/");
            RolePermissions      = @("microsoft.directory/applications/standard/limitedRead","microsoft.directory/applications/owners/limitedRead","microsoft.directory/applications/policies/limitedRead","microsoft.directory/domains/standard/read","microsoft.directory/groups/standard/limitedRead","microsoft.directory/groups/appRoleAssignments/limitedRead","microsoft.directory/groups/memberOf/limitedRead","microsoft.directory/groups/members/limitedRead","microsoft.directory/groups/owners/limitedRead","microsoft.directory/groups/settings/limitedRead","microsoft.directory/organization/basicProfile/read","microsoft.directory/servicePrincipals/appRoleAssignedTo/limitedRead","microsoft.directory/servicePrincipals/appRoleAssignments/limitedRead","microsoft.directory/servicePrincipals/standard/limitedRead","microsoft.directory/servicePrincipals/memberOf/limitedRead","microsoft.directory/servicePrincipals/oAuth2PermissionGrants/limitedRead","microsoft.directory/servicePrincipals/owners/limitedRead","microsoft.directory/servicePrincipals/ownedObjects/limitedRead","microsoft.directory/servicePrincipals/policies/limitedRead","microsoft.directory/users/inviteGuest","microsoft.directory/users/guestBasicProfile/limitedRead","microsoft.directory/users/standard/read","microsoft.directory/users/appRoleAssignments/read","microsoft.directory/users/deviceForResourceAccount/read","microsoft.directory/users/directReports/read","microsoft.directory/users/eligibleMemberOf/read","microsoft.directory/users/licenseDetails/read","microsoft.directory/users/manager/read","microsoft.directory/users/memberOf/read","microsoft.directory/users/oAuth2PermissionGrants/read","microsoft.directory/users/ownedDevices/read","microsoft.directory/users/ownedObjects/read","microsoft.directory/users/pendingMemberOf/read","microsoft.directory/users/photo/read","microsoft.directory/users/registeredDevices/read","microsoft.directory/users/scopedRoleMemberOf/read","microsoft.directory/users/password/update");
            TemplateId           = "10dae51f-b6af-4016-8d66-8c2a99b929b3";
            Version              = "1";
        }
        AADRoleDefinition 58685cb7-78b8-408e-a074-9b122b613160
        {
            Credential           = $Credscredential;
            Description          = "Restricted role for guest users. Can read a limited set of directory information.";
            DisplayName          = "Restricted Guest User";
            Ensure               = "Present";
            Id                   = "2af84b1e-32c8-42b7-82bc-daa82404023b";
            IsEnabled            = $True;
            Managedidentity      = $False;
            ResourceScopes       = @("/");
            RolePermissions      = @("microsoft.directory/applications/standard/limitedRead","microsoft.directory/applications/owners/limitedRead","microsoft.directory/applications/policies/limitedRead","microsoft.directory/domains/standard/read","microsoft.directory/organization/basicProfile/read","microsoft.directory/servicePrincipals/appRoleAssignedTo/limitedRead","microsoft.directory/servicePrincipals/appRoleAssignments/limitedRead","microsoft.directory/servicePrincipals/standard/limitedRead","microsoft.directory/servicePrincipals/memberOf/limitedRead","microsoft.directory/servicePrincipals/oAuth2PermissionGrants/limitedRead","microsoft.directory/servicePrincipals/owners/limitedRead","microsoft.directory/servicePrincipals/ownedObjects/limitedRead","microsoft.directory/servicePrincipals/policies/limitedRead","microsoft.directory/users/standard/read","microsoft.directory/users/appRoleAssignments/read","microsoft.directory/users/deviceForResourceAccount/read","microsoft.directory/users/directReports/read","microsoft.directory/users/eligibleMemberOf/read","microsoft.directory/users/licenseDetails/read","microsoft.directory/users/manager/read","microsoft.directory/users/memberOf/read","microsoft.directory/users/oAuth2PermissionGrants/read","microsoft.directory/users/ownedDevices/read","microsoft.directory/users/ownedObjects/read","microsoft.directory/users/pendingMemberOf/read","microsoft.directory/users/photo/read","microsoft.directory/users/registeredDevices/read","microsoft.directory/users/scopedRoleMemberOf/read","microsoft.directory/users/password/update");
            TemplateId           = "2af84b1e-32c8-42b7-82bc-daa82404023b";
            Version              = "1";
        }
        AADRoleDefinition fe1bf516-2616-457a-9626-d6338fb4cf93
        {
            Credential           = $Credscredential;
            Description          = "Can invite guest users independent of the 'members can invite guests' setting.";
            DisplayName          = "Guest Inviter";
            Ensure               = "Present";
            Id                   = "95e79109-95c0-4d8e-aee3-d01accf2d47b";
            IsEnabled            = $True;
            Managedidentity      = $False;
            ResourceScopes       = @("/");
            RolePermissions      = @("microsoft.directory/users/inviteGuest","microsoft.directory/users/standard/read","microsoft.directory/users/appRoleAssignments/read","microsoft.directory/users/deviceForResourceAccount/read","microsoft.directory/users/directReports/read","microsoft.directory/users/licenseDetails/read","microsoft.directory/users/manager/read","microsoft.directory/users/memberOf/read","microsoft.directory/users/oAuth2PermissionGrants/read","microsoft.directory/users/ownedDevices/read","microsoft.directory/users/ownedObjects/read","microsoft.directory/users/photo/read","microsoft.directory/users/registeredDevices/read","microsoft.directory/users/scopedRoleMemberOf/read");
            TemplateId           = "95e79109-95c0-4d8e-aee3-d01accf2d47b";
            Version              = "1";
        }
        AADRoleDefinition 9bf3967c-6bdb-4d1a-afcd-d8f50001cc84
        {
            Credential           = $Credscredential;
            Description          = "Can manage all aspects of users and groups, including resetting passwords for limited admins.";
            DisplayName          = "User Administrator";
            Ensure               = "Present";
            Id                   = "fe930be7-5e62-47db-91af-98c3a49a38b1";
            IsEnabled            = $True;
            Managedidentity      = $False;
            ResourceScopes       = @("/");
            RolePermissions      = @("microsoft.directory/accessReviews/definitions.applications/allProperties/allTasks","microsoft.directory/accessReviews/definitions.directoryRoles/allProperties/read","microsoft.directory/accessReviews/definitions.entitlementManagement/allProperties/allTasks","microsoft.directory/accessReviews/definitions.groups/allProperties/update","microsoft.directory/accessReviews/definitions.groups/create","microsoft.directory/accessReviews/definitions.groups/delete","microsoft.directory/accessReviews/definitions.groups/allProperties/read","microsoft.directory/contacts/create","microsoft.directory/contacts/delete","microsoft.directory/contacts/basic/update","microsoft.directory/deletedItems.groups/restore","microsoft.directory/deletedItems.users/restore","microsoft.directory/entitlementManagement/allProperties/allTasks","microsoft.directory/groups/assignLicense","microsoft.directory/groups/create","microsoft.directory/groups/delete","microsoft.directory/groups/hiddenMembers/read","microsoft.directory/groups/reprocessLicenseAssignment","microsoft.directory/groups/restore","microsoft.directory/groups/basic/update","microsoft.directory/groups/classification/update","microsoft.directory/groups/dynamicMembershipRule/update","microsoft.directory/groups/groupType/update","microsoft.directory/groups/members/update","microsoft.directory/groups/onPremWriteBack/update","microsoft.directory/groups/owners/update","microsoft.directory/groups/settings/update","microsoft.directory/groups/visibility/update","microsoft.directory/oAuth2PermissionGrants/allProperties/allTasks","microsoft.directory/policies/standard/read","microsoft.directory/servicePrincipals/appRoleAssignedTo/update","microsoft.directory/users/assignLicense","microsoft.directory/users/create","microsoft.directory/users/delete","microsoft.directory/users/disable","microsoft.directory/users/enable","microsoft.directory/users/inviteGuest","microsoft.directory/users/invalidateAllRefreshTokens","microsoft.directory/users/reprocessLicenseAssignment","microsoft.directory/users/restore","microsoft.directory/users/basic/update","microsoft.directory/users/manager/update","microsoft.directory/users/password/update","microsoft.directory/users/photo/update","microsoft.directory/users/userPrincipalName/update","microsoft.azure.serviceHealth/allEntities/allTasks","microsoft.azure.supportTickets/allEntities/allTasks","microsoft.office365.serviceHealth/allEntities/allTasks","microsoft.office365.supportTickets/allEntities/allTasks","microsoft.office365.webPortal/allEntities/standard/read");
            TemplateId           = "fe930be7-5e62-47db-91af-98c3a49a38b1";
            Version              = "1";
        }
        AADRoleDefinition 63b81f22-f8d6-43bc-bee1-5c381e5699be
        {
            Credential           = $Credscredential;
            Description          = "Can reset passwords for non-administrators and Helpdesk Administrators.";
            DisplayName          = "Helpdesk Administrator";
            Ensure               = "Present";
            Id                   = "729827e3-9c14-49f7-bb1b-9608f156bbb8";
            IsEnabled            = $True;
            Managedidentity      = $False;
            ResourceScopes       = @("/");
            RolePermissions      = @("microsoft.directory/bitlockerKeys/key/read","microsoft.directory/users/invalidateAllRefreshTokens","microsoft.directory/users/password/update","microsoft.azure.serviceHealth/allEntities/allTasks","microsoft.azure.supportTickets/allEntities/allTasks","microsoft.office365.serviceHealth/allEntities/allTasks","microsoft.office365.supportTickets/allEntities/allTasks","microsoft.office365.webPortal/allEntities/standard/read");
            TemplateId           = "729827e3-9c14-49f7-bb1b-9608f156bbb8";
            Version              = "1";
        }
        AADRoleDefinition 2a819c6c-c19f-41b7-930b-44bd088718ff
        {
            Credential           = $Credscredential;
            Description          = "Can read service health information and manage support tickets.";
            DisplayName          = "Service Support Administrator";
            Ensure               = "Present";
            Id                   = "f023fd81-a637-4b56-95fd-791ac0226033";
            IsEnabled            = $True;
            Managedidentity      = $False;
            ResourceScopes       = @("/");
            RolePermissions      = @("microsoft.azure.serviceHealth/allEntities/allTasks","microsoft.azure.supportTickets/allEntities/allTasks","microsoft.office365.network/performance/allProperties/read","microsoft.office365.serviceHealth/allEntities/allTasks","microsoft.office365.supportTickets/allEntities/allTasks","microsoft.office365.webPortal/allEntities/standard/read");
            TemplateId           = "f023fd81-a637-4b56-95fd-791ac0226033";
            Version              = "1";
        }
        AADRoleDefinition 57e31498-8f6f-442c-845e-ae6d9858266d
        {
            Credential           = $Credscredential;
            Description          = "Can perform common billing related tasks like updating payment information.";
            DisplayName          = "Billing Administrator";
            Ensure               = "Present";
            Id                   = "b0f54661-2d74-4c50-afa3-1ec803f12efe";
            IsEnabled            = $True;
            Managedidentity      = $False;
            ResourceScopes       = @("/");
            RolePermissions      = @("microsoft.directory/organization/basic/update","microsoft.azure.serviceHealth/allEntities/allTasks","microsoft.azure.supportTickets/allEntities/allTasks","microsoft.commerce.billing/allEntities/allProperties/allTasks","microsoft.office365.serviceHealth/allEntities/allTasks","microsoft.office365.supportTickets/allEntities/allTasks","microsoft.office365.webPortal/allEntities/standard/read");
            TemplateId           = "b0f54661-2d74-4c50-afa3-1ec803f12efe";
            Version              = "1";
        }
        AADRoleDefinition fb53be79-896d-4135-bc92-b9f1498e8ee9
        {
            Credential           = $Credscredential;
            Description          = "Default role for member users. Can read all and write a limited set of directory information.";
            DisplayName          = "User";
            Ensure               = "Present";
            Id                   = "a0b1b346-4d3e-4e8b-98f8-753987be4970";
            IsEnabled            = $True;
            Managedidentity      = $False;
            ResourceScopes       = @("/");
            RolePermissions      = @("microsoft.directory/administrativeUnits/standard/read","microsoft.directory/administrativeUnits/members/read","microsoft.directory/applications/standard/read","microsoft.directory/applications/owners/read","microsoft.directory/applications/policies/read","microsoft.directory/applications/createAsOwner","microsoft.directory/authorizationPolicy/standard/read","microsoft.directory/contacts/standard/read","microsoft.directory/contacts/memberOf/read","microsoft.directory/contracts/standard/read","microsoft.directory/devices/standard/read","microsoft.directory/devices/memberOf/read","microsoft.directory/devices/registeredOwners/read","microsoft.directory/devices/registeredUsers/read","microsoft.directory/directoryRoles/standard/read","microsoft.directory/directoryRoles/eligibleMembers/read","microsoft.directory/directoryRoles/members/read","microsoft.directory/domains/standard/read","microsoft.directory/groups/createAsOwner","microsoft.directory/groups/standard/read","microsoft.directory/groups/appRoleAssignments/read","microsoft.directory/groups/memberOf/read","microsoft.directory/groups/members/read","microsoft.directory/groups/owners/read","microsoft.directory/oAuth2PermissionGrants/standard/read","microsoft.directory/organization/standard/read","microsoft.directory/policies/standard/read","microsoft.directory/policies/owners/read","microsoft.directory/policies/policyAppliedTo/read","microsoft.directory/applicationPolicies/createAsOwner","microsoft.directory/applicationPolicies/standard/read","microsoft.directory/roleAssignments/standard/read","microsoft.directory/roleDefinitions/standard/read","microsoft.directory/servicePrincipals/createAsOwner","microsoft.directory/servicePrincipals/authentication/read","microsoft.directory/servicePrincipals/appRoleAssignedTo/read","microsoft.directory/servicePrincipals/appRoleAssignments/read","microsoft.directory/servicePrincipals/standard/read","microsoft.directory/servicePrincipals/memberOf/read","microsoft.directory/servicePrincipals/oAuth2PermissionGrants/read","microsoft.directory/servicePrincipals/owners/read","microsoft.directory/servicePrincipals/ownedObjects/read","microsoft.directory/servicePrincipals/policies/read","microsoft.directory/subscribedSkus/standard/read","microsoft.directory/tenantManagement/tenants/create","microsoft.directory/users/activateServicePlan","microsoft.directory/users/inviteGuest","microsoft.directory/users/standard/read","microsoft.directory/users/appRoleAssignments/read","microsoft.directory/users/deviceForResourceAccount/read","microsoft.directory/users/directReports/read","microsoft.directory/users/licenseDetails/read","microsoft.directory/users/manager/read","microsoft.directory/users/memberOf/read","microsoft.directory/users/oAuth2PermissionGrants/read","microsoft.directory/users/ownedDevices/read","microsoft.directory/users/ownedObjects/read","microsoft.directory/users/photo/read","microsoft.directory/users/registeredDevices/read","microsoft.directory/users/scopedRoleMemberOf/read","microsoft.directory/applications/delete","microsoft.directory/applications/appRoles/update","microsoft.directory/applications/audience/update","microsoft.directory/applications/authentication/update","microsoft.directory/applications/basic/update","microsoft.directory/applications/credentials/update","microsoft.directory/applications/extensionProperties/update","microsoft.directory/applications/notes/update","microsoft.directory/applications/owners/update","microsoft.directory/applications/permissions/update","microsoft.directory/applications/policies/update","microsoft.directory/applications/tag/update","microsoft.directory/applications/verification/update","microsoft.directory/auditLogs/allProperties/read","microsoft.directory/deletedItems.applications/delete","microsoft.directory/deletedItems.applications/restore","microsoft.directory/deletedItems.groups/restore","microsoft.directory/devices/disable","microsoft.directory/groups/delete","microsoft.directory/groups/restore","microsoft.directory/groups/basic/update","microsoft.directory/groups/classification/update","microsoft.directory/groups/groupType/update","microsoft.directory/groups/members/update","microsoft.directory/groups/owners/update","microsoft.directory/groups/settings/update","microsoft.directory/groups/visibility/update","microsoft.directory/groupsAssignableToRoles/delete","microsoft.directory/groupsAssignableToRoles/restore","microsoft.directory/groupsAssignableToRoles/allProperties/update","microsoft.directory/policies/delete","microsoft.directory/policies/basic/update","microsoft.directory/policies/owners/update","microsoft.directory/provisioningLogs/allProperties/read","microsoft.directory/servicePrincipals/delete","microsoft.directory/servicePrincipals/disable","microsoft.directory/servicePrincipals/enable","microsoft.directory/servicePrincipals/getPasswordSingleSignOnCredentials","microsoft.directory/servicePrincipals/managePasswordSingleSignOnCredentials","microsoft.directory/servicePrincipals/appRoleAssignedTo/update","microsoft.directory/servicePrincipals/audience/update","microsoft.directory/servicePrincipals/authentication/update","microsoft.directory/servicePrincipals/basic/update","microsoft.directory/servicePrincipals/credentials/update","microsoft.directory/servicePrincipals/notes/update","microsoft.directory/servicePrincipals/owners/update","microsoft.directory/servicePrincipals/permissions/update","microsoft.directory/servicePrincipals/policies/update","microsoft.directory/servicePrincipals/tag/update","microsoft.directory/signInReports/allProperties/read","microsoft.directory/users/changePassword","microsoft.directory/users/invalidateAllRefreshTokens","microsoft.directory/users/basicProfile/update","microsoft.directory/users/identities/update","microsoft.directory/users/mobile/update","microsoft.directory/users/searchableDeviceKey/update","microsoft.directory/userInfos/address/read","microsoft.directory/userInfos/email/read","microsoft.directory/userInfos/openId/read","microsoft.directory/userInfos/phone/read","microsoft.directory/userInfos/profile/read");
            TemplateId           = "a0b1b346-4d3e-4e8b-98f8-753987be4970";
            Version              = "1";
        }
        AADRoleDefinition 1ce0b02c-b129-4401-b906-a04d2b1373f2
        {
            Credential           = $Credscredential;
            Description          = "Do not use - not intended for general use.";
            DisplayName          = "Partner Tier1 Support";
            Ensure               = "Present";
            Id                   = "4ba39ca4-527c-499a-b93d-d9b492c50246";
            IsEnabled            = $True;
            Managedidentity      = $False;
            ResourceScopes       = @("/");
            RolePermissions      = @("microsoft.directory/applications/appRoles/update","microsoft.directory/applications/audience/update","microsoft.directory/applications/authentication/update","microsoft.directory/applications/basic/update","microsoft.directory/applications/credentials/update","microsoft.directory/applications/notes/update","microsoft.directory/applications/owners/update","microsoft.directory/applications/permissions/update","microsoft.directory/applications/policies/update","microsoft.directory/applications/tag/update","microsoft.directory/contacts/create","microsoft.directory/contacts/delete","microsoft.directory/contacts/basic/update","microsoft.directory/deletedItems.groups/restore","microsoft.directory/deletedItems.users/restore","microsoft.directory/groups/create","microsoft.directory/groups/delete","microsoft.directory/groups/restore","microsoft.directory/groups/members/update","microsoft.directory/groups/owners/update","microsoft.directory/oAuth2PermissionGrants/allProperties/allTasks","microsoft.directory/servicePrincipals/appRoleAssignedTo/update","microsoft.directory/users/assignLicense","microsoft.directory/users/create","microsoft.directory/users/delete","microsoft.directory/users/disable","microsoft.directory/users/enable","microsoft.directory/users/invalidateAllRefreshTokens","microsoft.directory/users/restore","microsoft.directory/users/basic/update","microsoft.directory/users/manager/update","microsoft.directory/users/password/update","microsoft.directory/users/photo/update","microsoft.directory/users/userPrincipalName/update","microsoft.azure.serviceHealth/allEntities/allTasks","microsoft.azure.supportTickets/allEntities/allTasks","microsoft.office365.serviceHealth/allEntities/allTasks","microsoft.office365.supportTickets/allEntities/allTasks","microsoft.office365.webPortal/allEntities/standard/read");
            TemplateId           = "4ba39ca4-527c-499a-b93d-d9b492c50246";
            Version              = "1";
        }
        AADRoleDefinition 203dd0c7-6b28-44cc-8adf-9c08461fb6a7
        {
            Credential           = $Credscredential;
            Description          = "Do not use - not intended for general use.";
            DisplayName          = "Partner Tier2 Support";
            Ensure               = "Present";
            Id                   = "e00e864a-17c5-4a4b-9c06-f5b95a8d5bd8";
            IsEnabled            = $True;
            Managedidentity      = $False;
            ResourceScopes       = @("/");
            RolePermissions      = @("microsoft.directory/applications/appRoles/update","microsoft.directory/applications/audience/update","microsoft.directory/applications/authentication/update","microsoft.directory/applications/basic/update","microsoft.directory/applications/credentials/update","microsoft.directory/applications/notes/update","microsoft.directory/applications/owners/update","microsoft.directory/applications/permissions/update","microsoft.directory/applications/policies/update","microsoft.directory/applications/tag/update","microsoft.directory/contacts/create","microsoft.directory/contacts/delete","microsoft.directory/contacts/basic/update","microsoft.directory/deletedItems.groups/restore","microsoft.directory/deletedItems.users/restore","microsoft.directory/domains/allProperties/allTasks","microsoft.directory/groups/create","microsoft.directory/groups/delete","microsoft.directory/groups/restore","microsoft.directory/groups/members/update","microsoft.directory/groups/owners/update","microsoft.directory/oAuth2PermissionGrants/allProperties/allTasks","microsoft.directory/organization/basic/update","microsoft.directory/roleAssignments/allProperties/allTasks","microsoft.directory/roleDefinitions/allProperties/allTasks","microsoft.directory/scopedRoleMemberships/allProperties/allTasks","microsoft.directory/servicePrincipals/appRoleAssignedTo/update","microsoft.directory/subscribedSkus/standard/read","microsoft.directory/users/assignLicense","microsoft.directory/users/create","microsoft.directory/users/delete","microsoft.directory/users/disable","microsoft.directory/users/enable","microsoft.directory/users/invalidateAllRefreshTokens","microsoft.directory/users/restore","microsoft.directory/users/basic/update","microsoft.directory/users/manager/update","microsoft.directory/users/password/update","microsoft.directory/users/photo/update","microsoft.directory/users/userPrincipalName/update","microsoft.azure.serviceHealth/allEntities/allTasks","microsoft.azure.supportTickets/allEntities/allTasks","microsoft.office365.serviceHealth/allEntities/allTasks","microsoft.office365.supportTickets/allEntities/allTasks","microsoft.office365.webPortal/allEntities/standard/read");
            TemplateId           = "e00e864a-17c5-4a4b-9c06-f5b95a8d5bd8";
            Version              = "1";
        }
        AADRoleDefinition 2a73fe97-6dcc-43c5-95cf-93f1110a434f
        {
            Credential           = $Credscredential;
            Description          = "Can read basic directory information. Commonly used to grant directory read access to applications and guests.";
            DisplayName          = "Directory Readers";
            Ensure               = "Present";
            Id                   = "88d8e3e3-8f55-4a1e-953a-9b9898b8876b";
            IsEnabled            = $True;
            Managedidentity      = $False;
            ResourceScopes       = @("/");
            RolePermissions      = @("microsoft.directory/administrativeUnits/standard/read","microsoft.directory/administrativeUnits/members/read","microsoft.directory/applications/standard/read","microsoft.directory/applications/owners/read","microsoft.directory/applications/policies/read","microsoft.directory/contacts/standard/read","microsoft.directory/contacts/memberOf/read","microsoft.directory/contracts/standard/read","microsoft.directory/devices/standard/read","microsoft.directory/devices/memberOf/read","microsoft.directory/devices/registeredOwners/read","microsoft.directory/devices/registeredUsers/read","microsoft.directory/directoryRoles/standard/read","microsoft.directory/directoryRoles/eligibleMembers/read","microsoft.directory/directoryRoles/members/read","microsoft.directory/domains/standard/read","microsoft.directory/groups/standard/read","microsoft.directory/groups/appRoleAssignments/read","microsoft.directory/groups/memberOf/read","microsoft.directory/groups/members/read","microsoft.directory/groups/owners/read","microsoft.directory/groups/settings/read","microsoft.directory/groupSettings/standard/read","microsoft.directory/groupSettingTemplates/standard/read","microsoft.directory/oAuth2PermissionGrants/standard/read","microsoft.directory/organization/standard/read","microsoft.directory/organization/trustedCAsForPasswordlessAuth/read","microsoft.directory/applicationPolicies/standard/read","microsoft.directory/roleAssignments/standard/read","microsoft.directory/roleDefinitions/standard/read","microsoft.directory/servicePrincipals/appRoleAssignedTo/read","microsoft.directory/servicePrincipals/appRoleAssignments/read","microsoft.directory/servicePrincipals/standard/read","microsoft.directory/servicePrincipals/memberOf/read","microsoft.directory/servicePrincipals/oAuth2PermissionGrants/read","microsoft.directory/servicePrincipals/owners/read","microsoft.directory/servicePrincipals/ownedObjects/read","microsoft.directory/servicePrincipals/policies/read","microsoft.directory/subscribedSkus/standard/read","microsoft.directory/users/standard/read","microsoft.directory/users/appRoleAssignments/read","microsoft.directory/users/deviceForResourceAccount/read","microsoft.directory/users/directReports/read","microsoft.directory/users/licenseDetails/read","microsoft.directory/users/manager/read","microsoft.directory/users/memberOf/read","microsoft.directory/users/oAuth2PermissionGrants/read","microsoft.directory/users/ownedDevices/read","microsoft.directory/users/ownedObjects/read","microsoft.directory/users/photo/read","microsoft.directory/users/registeredDevices/read","microsoft.directory/users/scopedRoleMemberOf/read");
            TemplateId           = "88d8e3e3-8f55-4a1e-953a-9b9898b8876b";
            Version              = "1";
        }
        AADRoleDefinition bcd6cc6d-d155-4cd0-850e-3c9b9cce51f8
        {
            Credential           = $Credscredential;
            Description          = "Can read and write basic directory information. For granting access to applications, not intended for users.";
            DisplayName          = "Directory Writers";
            Ensure               = "Present";
            Id                   = "9360feb5-f418-4baa-8175-e2a00bac4301";
            IsEnabled            = $True;
            Managedidentity      = $False;
            ResourceScopes       = @("/");
            RolePermissions      = @("microsoft.directory/applications/extensionProperties/update","microsoft.directory/contacts/create","microsoft.directory/groups/assignLicense","microsoft.directory/groups/create","microsoft.directory/groups/reprocessLicenseAssignment","microsoft.directory/groups/basic/update","microsoft.directory/groups/classification/update","microsoft.directory/groups/dynamicMembershipRule/update","microsoft.directory/groups/groupType/update","microsoft.directory/groups/members/update","microsoft.directory/groups/onPremWriteBack/update","microsoft.directory/groups/owners/update","microsoft.directory/groups/settings/update","microsoft.directory/groups/visibility/update","microsoft.directory/groupSettings/create","microsoft.directory/groupSettings/delete","microsoft.directory/groupSettings/basic/update","microsoft.directory/oAuth2PermissionGrants/create","microsoft.directory/oAuth2PermissionGrants/basic/update","microsoft.directory/servicePrincipals/synchronizationCredentials/manage","microsoft.directory/servicePrincipals/synchronizationJobs/manage","microsoft.directory/servicePrincipals/synchronizationSchema/manage","microsoft.directory/servicePrincipals/appRoleAssignedTo/update","microsoft.directory/users/assignLicense","microsoft.directory/users/create","microsoft.directory/users/disable","microsoft.directory/users/enable","microsoft.directory/users/invalidateAllRefreshTokens","microsoft.directory/users/inviteGuest","microsoft.directory/users/reprocessLicenseAssignment","microsoft.directory/users/basic/update","microsoft.directory/users/manager/update","microsoft.directory/users/photo/update","microsoft.directory/users/userPrincipalName/update");
            TemplateId           = "9360feb5-f418-4baa-8175-e2a00bac4301";
            Version              = "1";
        }
        AADRoleDefinition 9152ba39-a3af-48e6-beb7-12b09eeee090
        {
            Credential           = $Credscredential;
            Description          = "Can manage all aspects of the Exchange product.";
            DisplayName          = "Exchange Administrator";
            Ensure               = "Present";
            Id                   = "29232cdf-9323-42fd-ade2-1d097af3e4de";
            IsEnabled            = $True;
            Managedidentity      = $False;
            ResourceScopes       = @("/");
            RolePermissions      = @("microsoft.directory/groups/hiddenMembers/read","microsoft.directory/groups.unified/create","microsoft.directory/groups.unified/delete","microsoft.directory/groups.unified/restore","microsoft.directory/groups.unified/basic/update","microsoft.directory/groups.unified/members/update","microsoft.directory/groups.unified/owners/update","microsoft.azure.serviceHealth/allEntities/allTasks","microsoft.azure.supportTickets/allEntities/allTasks","microsoft.office365.exchange/allEntities/basic/allTasks","microsoft.office365.network/performance/allProperties/read","microsoft.office365.serviceHealth/allEntities/allTasks","microsoft.office365.supportTickets/allEntities/allTasks","microsoft.office365.usageReports/allEntities/allProperties/read","microsoft.office365.webPortal/allEntities/standard/read");
            TemplateId           = "29232cdf-9323-42fd-ade2-1d097af3e4de";
            Version              = "1";
        }
        AADRoleDefinition e7f648d0-c422-4607-b1a0-4094e6855b3c
        {
            Credential           = $Credscredential;
            Description          = "Can manage all aspects of the SharePoint service.";
            DisplayName          = "SharePoint Administrator";
            Ensure               = "Present";
            Id                   = "f28a1f50-f6e7-4571-818b-6a12f2af6b6c";
            IsEnabled            = $True;
            Managedidentity      = $False;
            ResourceScopes       = @("/");
            RolePermissions      = @("microsoft.directory/groups/hiddenMembers/read","microsoft.directory/groups.unified/create","microsoft.directory/groups.unified/delete","microsoft.directory/groups.unified/restore","microsoft.directory/groups.unified/basic/update","microsoft.directory/groups.unified/members/update","microsoft.directory/groups.unified/owners/update","microsoft.azure.serviceHealth/allEntities/allTasks","microsoft.azure.supportTickets/allEntities/allTasks","microsoft.office365.network/performance/allProperties/read","microsoft.office365.serviceHealth/allEntities/allTasks","microsoft.office365.sharePoint/allEntities/allTasks","microsoft.office365.supportTickets/allEntities/allTasks","microsoft.office365.usageReports/allEntities/allProperties/read","microsoft.office365.webPortal/allEntities/standard/read");
            TemplateId           = "f28a1f50-f6e7-4571-818b-6a12f2af6b6c";
            Version              = "1";
        }
        AADRoleDefinition 830f17d2-faf6-45eb-bdef-d383e90886d5
        {
            Credential           = $Credscredential;
            Description          = "Can manage all aspects of the Skype for Business product.";
            DisplayName          = "Skype for Business Administrator";
            Ensure               = "Present";
            Id                   = "75941009-915a-4869-abe7-691bff18279e";
            IsEnabled            = $True;
            Managedidentity      = $False;
            ResourceScopes       = @("/");
            RolePermissions      = @("microsoft.azure.serviceHealth/allEntities/allTasks","microsoft.azure.supportTickets/allEntities/allTasks","microsoft.office365.serviceHealth/allEntities/allTasks","microsoft.office365.skypeForBusiness/allEntities/allTasks","microsoft.office365.supportTickets/allEntities/allTasks","microsoft.office365.usageReports/allEntities/allProperties/read","microsoft.office365.webPortal/allEntities/standard/read");
            TemplateId           = "75941009-915a-4869-abe7-691bff18279e";
            Version              = "1";
        }
        AADRoleDefinition d81efdfe-3ae1-4634-8022-ff2805ddfc23
        {
            Credential           = $Credscredential;
            Description          = "Users assigned to this role are added to the local administrators group on Azure AD-joined devices.";
            DisplayName          = "Azure AD Joined Device Local Administrator";
            Ensure               = "Present";
            Id                   = "9f06204d-73c1-4d4c-880a-6edb90606fd8";
            IsEnabled            = $True;
            Managedidentity      = $False;
            ResourceScopes       = @("/");
            RolePermissions      = @("microsoft.directory/groupSettings/standard/read","microsoft.directory/groupSettingTemplates/standard/read");
            TemplateId           = "9f06204d-73c1-4d4c-880a-6edb90606fd8";
            Version              = "1";
        }
        AADRoleDefinition df919a5d-20ac-46e0-8852-70d78d31c3af
        {
            Credential           = $Credscredential;
            Description          = "Can read and manage compliance configuration and reports in Azure AD and Microsoft 365.";
            DisplayName          = "Compliance Administrator";
            Ensure               = "Present";
            Id                   = "17315797-102d-40b4-93e0-432062caca18";
            IsEnabled            = $True;
            Managedidentity      = $False;
            ResourceScopes       = @("/");
            RolePermissions      = @("microsoft.azure.serviceHealth/allEntities/allTasks","microsoft.azure.supportTickets/allEntities/allTasks","microsoft.directory/entitlementManagement/allProperties/read","microsoft.office365.complianceManager/allEntities/allTasks","microsoft.office365.serviceHealth/allEntities/allTasks","microsoft.office365.supportTickets/allEntities/allTasks","microsoft.office365.webPortal/allEntities/standard/read");
            TemplateId           = "17315797-102d-40b4-93e0-432062caca18";
            Version              = "1";
        }
        AADRoleDefinition 331fbb47-2d2f-414c-9852-af4a2a99e563
        {
            Credential           = $Credscredential;
            Description          = "Only used by Azure AD Connect service.";
            DisplayName          = "Directory Synchronization Accounts";
            Ensure               = "Present";
            Id                   = "d29b2b05-8046-44ba-8758-1e26182fcf32";
            IsEnabled            = $True;
            Managedidentity      = $False;
            ResourceScopes       = @("/");
            RolePermissions      = @("microsoft.directory/applications/create","microsoft.directory/applications/delete","microsoft.directory/applications/appRoles/update","microsoft.directory/applications/audience/update","microsoft.directory/applications/authentication/update","microsoft.directory/applications/basic/update","microsoft.directory/applications/credentials/update","microsoft.directory/applications/notes/update","microsoft.directory/applications/owners/update","microsoft.directory/applications/permissions/update","microsoft.directory/applications/policies/update","microsoft.directory/applications/tag/update","microsoft.directory/authorizationPolicy/standard/read","microsoft.directory/hybridAuthenticationPolicy/allProperties/allTasks","microsoft.directory/organization/dirSync/update","microsoft.directory/passwordHashSync/allProperties/allTasks","microsoft.directory/policies/create","microsoft.directory/policies/delete","microsoft.directory/policies/standard/read","microsoft.directory/policies/owners/read","microsoft.directory/policies/policyAppliedTo/read","microsoft.directory/policies/basic/update","microsoft.directory/policies/owners/update","microsoft.directory/policies/tenantDefault/update","microsoft.directory/servicePrincipals/create","microsoft.directory/servicePrincipals/delete","microsoft.directory/servicePrincipals/enable","microsoft.directory/servicePrincipals/disable","microsoft.directory/servicePrincipals/getPasswordSingleSignOnCredentials","microsoft.directory/servicePrincipals/managePasswordSingleSignOnCredentials","microsoft.directory/servicePrincipals/appRoleAssignedTo/read","microsoft.directory/servicePrincipals/appRoleAssignments/read","microsoft.directory/servicePrincipals/standard/read","microsoft.directory/servicePrincipals/memberOf/read","microsoft.directory/servicePrincipals/oAuth2PermissionGrants/read","microsoft.directory/servicePrincipals/owners/read","microsoft.directory/servicePrincipals/ownedObjects/read","microsoft.directory/servicePrincipals/policies/read","microsoft.directory/servicePrincipals/appRoleAssignedTo/update","microsoft.directory/servicePrincipals/audience/update","microsoft.directory/servicePrincipals/authentication/update","microsoft.directory/servicePrincipals/basic/update","microsoft.directory/servicePrincipals/credentials/update","microsoft.directory/servicePrincipals/notes/update","microsoft.directory/servicePrincipals/owners/update","microsoft.directory/servicePrincipals/permissions/update","microsoft.directory/servicePrincipals/policies/update","microsoft.directory/servicePrincipals/tag/update");
            TemplateId           = "d29b2b05-8046-44ba-8758-1e26182fcf32";
            Version              = "1";
        }
        AADRoleDefinition 3964482e-b36d-4b1b-848f-1a8463166543
        {
            Credential           = $Credscredential;
            Description          = "Deprecated - Do Not Use.";
            DisplayName          = "Device Managers";
            Ensure               = "Present";
            Id                   = "2b499bcd-da44-4968-8aec-78e1674fa64d";
            IsEnabled            = $True;
            Managedidentity      = $False;
            ResourceScopes       = @("/");
            RolePermissions      = @("microsoft.directory/devices/standard/read","microsoft.directory/devices/memberOf/read","microsoft.directory/devices/registeredOwners/read","microsoft.directory/devices/registeredUsers/read","microsoft.directory/devices/basic/update","microsoft.directory/devices/extensionAttributeSet1/update","microsoft.directory/devices/extensionAttributeSet2/update","microsoft.directory/devices/extensionAttributeSet3/update","microsoft.directory/devices/registeredOwners/update","microsoft.directory/devices/registeredUsers/update");
            TemplateId           = "2b499bcd-da44-4968-8aec-78e1674fa64d";
            Version              = "1";
        }
        AADRoleDefinition 2a7cc1fe-269f-4e8c-9073-b5e2dc76f5bb
        {
            Credential           = $Credscredential;
            Description          = "Can create and manage all aspects of app registrations and enterprise apps.";
            DisplayName          = "Application Administrator";
            Ensure               = "Present";
            Id                   = "9b895d92-2cd3-44c7-9d02-a6ac2d5ea5c3";
            IsEnabled            = $True;
            Managedidentity      = $False;
            ResourceScopes       = @("/");
            RolePermissions      = @("microsoft.directory/adminConsentRequestPolicy/allProperties/allTasks","microsoft.directory/appConsent/appConsentRequests/allProperties/read","microsoft.directory/applications/create","microsoft.directory/applications/delete","microsoft.directory/applications/applicationProxy/read","microsoft.directory/applications/applicationProxy/update","microsoft.directory/applications/applicationProxyAuthentication/update","microsoft.directory/applications/applicationProxySslCertificate/update","microsoft.directory/applications/applicationProxyUrlSettings/update","microsoft.directory/applications/appRoles/update","microsoft.directory/applications/audience/update","microsoft.directory/applications/authentication/update","microsoft.directory/applications/basic/update","microsoft.directory/applications/credentials/update","microsoft.directory/applications/extensionProperties/update","microsoft.directory/applications/notes/update","microsoft.directory/applications/owners/update","microsoft.directory/applications/permissions/update","microsoft.directory/applications/policies/update","microsoft.directory/applications/tag/update","microsoft.directory/applications/verification/update","microsoft.directory/applications/synchronization/standard/read","microsoft.directory/applicationTemplates/instantiate","microsoft.directory/auditLogs/allProperties/read","microsoft.directory/connectors/create","microsoft.directory/connectors/allProperties/read","microsoft.directory/connectorGroups/create","microsoft.directory/connectorGroups/delete","microsoft.directory/connectorGroups/allProperties/read","microsoft.directory/connectorGroups/allProperties/update","microsoft.directory/customAuthenticationExtensions/allProperties/allTasks","microsoft.directory/deletedItems.applications/delete","microsoft.directory/deletedItems.applications/restore","microsoft.directory/oAuth2PermissionGrants/allProperties/allTasks","microsoft.directory/applicationPolicies/create","microsoft.directory/applicationPolicies/delete","microsoft.directory/applicationPolicies/standard/read","microsoft.directory/applicationPolicies/owners/read","microsoft.directory/applicationPolicies/policyAppliedTo/read","microsoft.directory/applicationPolicies/basic/update","microsoft.directory/applicationPolicies/owners/update","microsoft.directory/provisioningLogs/allProperties/read","microsoft.directory/servicePrincipals/create","microsoft.directory/servicePrincipals/delete","microsoft.directory/servicePrincipals/disable","microsoft.directory/servicePrincipals/enable","microsoft.directory/servicePrincipals/getPasswordSingleSignOnCredentials","microsoft.directory/servicePrincipals/synchronizationCredentials/manage","microsoft.directory/servicePrincipals/synchronizationJobs/manage","microsoft.directory/servicePrincipals/synchronizationSchema/manage","microsoft.directory/servicePrincipals/managePasswordSingleSignOnCredentials","microsoft.directory/servicePrincipals/managePermissionGrantsForAll.microsoft-application-admin","microsoft.directory/servicePrincipals/appRoleAssignedTo/update","microsoft.directory/servicePrincipals/audience/update","microsoft.directory/servicePrincipals/authentication/update","microsoft.directory/servicePrincipals/basic/update","microsoft.directory/servicePrincipals/credentials/update","microsoft.directory/servicePrincipals/notes/update","microsoft.directory/servicePrincipals/owners/update","microsoft.directory/servicePrincipals/permissions/update","microsoft.directory/servicePrincipals/policies/update","microsoft.directory/servicePrincipals/tag/update","microsoft.directory/servicePrincipals/synchronization/standard/read","microsoft.directory/signInReports/allProperties/read","microsoft.azure.serviceHealth/allEntities/allTasks","microsoft.azure.supportTickets/allEntities/allTasks","microsoft.office365.serviceHealth/allEntities/allTasks","microsoft.office365.supportTickets/allEntities/allTasks","microsoft.office365.webPortal/allEntities/standard/read");
            TemplateId           = "9b895d92-2cd3-44c7-9d02-a6ac2d5ea5c3";
            Version              = "1";
        }
        AADRoleDefinition 73e60937-39a8-4e84-814a-feee5d04e3a0
        {
            Credential           = $Credscredential;
            Description          = "Can create application registrations independent of the 'Users can register applications' setting.";
            DisplayName          = "Application Developer";
            Ensure               = "Present";
            Id                   = "cf1c38e5-3621-4004-a7cb-879624dced7c";
            IsEnabled            = $True;
            Managedidentity      = $False;
            ResourceScopes       = @("/");
            RolePermissions      = @("microsoft.directory/applications/createAsOwner","microsoft.directory/oAuth2PermissionGrants/createAsOwner","microsoft.directory/servicePrincipals/createAsOwner");
            TemplateId           = "cf1c38e5-3621-4004-a7cb-879624dced7c";
            Version              = "1";
        }
        AADRoleDefinition a2e94936-57e1-4c24-b780-43a3fba24508
        {
            Credential           = $Credscredential;
            Description          = "Can read security information and reports in Azure AD and Office 365.";
            DisplayName          = "Security Reader";
            Ensure               = "Present";
            Id                   = "5d6b6bb7-de71-4623-b4af-96380a352509";
            IsEnabled            = $True;
            Managedidentity      = $False;
            ResourceScopes       = @("/");
            RolePermissions      = @("microsoft.directory/accessReviews/definitions/allProperties/read","microsoft.directory/auditLogs/allProperties/read","microsoft.directory/authorizationPolicy/standard/read","microsoft.directory/bitlockerKeys/key/read","microsoft.directory/entitlementManagement/allProperties/read","microsoft.directory/identityProtection/allProperties/read","microsoft.directory/namedLocations/standard/read","microsoft.directory/policies/standard/read","microsoft.directory/policies/owners/read","microsoft.directory/policies/policyAppliedTo/read","microsoft.directory/conditionalAccessPolicies/standard/read","microsoft.directory/conditionalAccessPolicies/owners/read","microsoft.directory/conditionalAccessPolicies/policyAppliedTo/read","microsoft.directory/privilegedIdentityManagement/allProperties/read","microsoft.directory/provisioningLogs/allProperties/read","microsoft.directory/signInReports/allProperties/read","microsoft.azure.serviceHealth/allEntities/allTasks","microsoft.office365.protectionCenter/allEntities/standard/read","microsoft.office365.protectionCenter/attackSimulator/payload/allProperties/read","microsoft.office365.protectionCenter/attackSimulator/reports/allProperties/read","microsoft.office365.protectionCenter/attackSimulator/simulation/allProperties/read","microsoft.office365.serviceHealth/allEntities/allTasks","microsoft.office365.webPortal/allEntities/standard/read");
            TemplateId           = "5d6b6bb7-de71-4623-b4af-96380a352509";
            Version              = "1";
        }
        AADRoleDefinition 1967601d-63ca-4539-9cd4-f71e1b93b852
        {
            Credential           = $Credscredential;
            Description          = "Can read security information and reports, and manage configuration in Azure AD and Office 365.";
            DisplayName          = "Security Administrator";
            Ensure               = "Present";
            Id                   = "194ae4cb-b126-40b2-bd5b-6091b380977d";
            IsEnabled            = $True;
            Managedidentity      = $False;
            ResourceScopes       = @("/");
            RolePermissions      = @("microsoft.directory/applications/policies/update","microsoft.directory/auditLogs/allProperties/read","microsoft.directory/authorizationPolicy/standard/read","microsoft.directory/bitlockerKeys/key/read","microsoft.directory/crossTenantAccessPolicy/standard/read","microsoft.directory/crossTenantAccessPolicy/allowedCloudEndpoints/update","microsoft.directory/crossTenantAccessPolicy/basic/update","microsoft.directory/crossTenantAccessPolicy/default/standard/read","microsoft.directory/crossTenantAccessPolicy/default/b2bCollaboration/update","microsoft.directory/crossTenantAccessPolicy/default/b2bDirectConnect/update","microsoft.directory/crossTenantAccessPolicy/default/crossCloudMeetings/update","microsoft.directory/crossTenantAccessPolicy/default/tenantRestrictions/update","microsoft.directory/crossTenantAccessPolicy/partners/create","microsoft.directory/crossTenantAccessPolicy/partners/delete","microsoft.directory/crossTenantAccessPolicy/partners/standard/read","microsoft.directory/crossTenantAccessPolicy/partners/b2bCollaboration/update","microsoft.directory/crossTenantAccessPolicy/partners/b2bDirectConnect/update","microsoft.directory/crossTenantAccessPolicy/partners/crossCloudMeetings/update","microsoft.directory/crossTenantAccessPolicy/partners/tenantRestrictions/update","microsoft.directory/domains/federation/update","microsoft.directory/entitlementManagement/allProperties/read","microsoft.directory/identityProtection/allProperties/read","microsoft.directory/identityProtection/allProperties/update","microsoft.directory/namedLocations/create","microsoft.directory/namedLocations/delete","microsoft.directory/namedLocations/standard/read","microsoft.directory/namedLocations/basic/update","microsoft.directory/policies/create","microsoft.directory/policies/delete","microsoft.directory/policies/basic/update","microsoft.directory/policies/owners/update","microsoft.directory/policies/tenantDefault/update","microsoft.directory/conditionalAccessPolicies/create","microsoft.directory/conditionalAccessPolicies/delete","microsoft.directory/conditionalAccessPolicies/standard/read","microsoft.directory/conditionalAccessPolicies/owners/read","microsoft.directory/conditionalAccessPolicies/policyAppliedTo/read","microsoft.directory/conditionalAccessPolicies/basic/update","microsoft.directory/conditionalAccessPolicies/owners/update","microsoft.directory/conditionalAccessPolicies/tenantDefault/update","microsoft.directory/privilegedIdentityManagement/allProperties/read","microsoft.directory/provisioningLogs/allProperties/read","microsoft.directory/resourceNamespaces/resourceActions/authenticationContext/update","microsoft.directory/servicePrincipals/policies/update","microsoft.directory/signInReports/allProperties/read","microsoft.azure.serviceHealth/allEntities/allTasks","microsoft.azure.supportTickets/allEntities/allTasks","microsoft.office365.protectionCenter/allEntities/standard/read","microsoft.office365.protectionCenter/allEntities/basic/update","microsoft.office365.protectionCenter/attackSimulator/payload/allProperties/allTasks","microsoft.office365.protectionCenter/attackSimulator/reports/allProperties/read","microsoft.office365.protectionCenter/attackSimulator/simulation/allProperties/allTasks","microsoft.office365.serviceHealth/allEntities/allTasks","microsoft.office365.supportTickets/allEntities/allTasks","microsoft.office365.webPortal/allEntities/standard/read");
            TemplateId           = "194ae4cb-b126-40b2-bd5b-6091b380977d";
            Version              = "1";
        }
        AADRoleDefinition e41642bd-c508-4f93-86fb-fea21aa52780
        {
            Credential           = $Credscredential;
            Description          = "Can manage role assignments in Azure AD, and all aspects of Privileged Identity Management.";
            DisplayName          = "Privileged Role Administrator";
            Ensure               = "Present";
            Id                   = "e8611ab8-c189-46e8-94e1-60213ab1f814";
            IsEnabled            = $True;
            Managedidentity      = $False;
            ResourceScopes       = @("/");
            RolePermissions      = @("microsoft.directory/accessReviews/definitions.applications/allProperties/read","microsoft.directory/accessReviews/definitions.directoryRoles/allProperties/allTasks","microsoft.directory/accessReviews/definitions.groupsAssignableToRoles/allProperties/update","microsoft.directory/accessReviews/definitions.groupsAssignableToRoles/create","microsoft.directory/accessReviews/definitions.groupsAssignableToRoles/delete","microsoft.directory/accessReviews/definitions.groups/allProperties/read","microsoft.directory/administrativeUnits/allProperties/allTasks","microsoft.directory/authorizationPolicy/allProperties/allTasks","microsoft.directory/directoryRoles/allProperties/allTasks","microsoft.directory/groupsAssignableToRoles/create","microsoft.directory/groupsAssignableToRoles/delete","microsoft.directory/groupsAssignableToRoles/restore","microsoft.directory/groupsAssignableToRoles/allProperties/update","microsoft.directory/oAuth2PermissionGrants/allProperties/allTasks","microsoft.directory/privilegedIdentityManagement/allProperties/allTasks","microsoft.directory/roleAssignments/allProperties/allTasks","microsoft.directory/roleDefinitions/allProperties/allTasks","microsoft.directory/scopedRoleMemberships/allProperties/allTasks","microsoft.directory/servicePrincipals/appRoleAssignedTo/update","microsoft.directory/servicePrincipals/permissions/update","microsoft.directory/servicePrincipals/managePermissionGrantsForAll.microsoft-company-admin","microsoft.office365.webPortal/allEntities/standard/read");
            TemplateId           = "e8611ab8-c189-46e8-94e1-60213ab1f814";
            Version              = "1";
        }
        AADRoleDefinition c401e1e9-8d8c-495a-840e-2447c67c96c5
        {
            Credential           = $Credscredential;
            Description          = "Can manage all aspects of the Intune product.";
            DisplayName          = "Intune Administrator";
            Ensure               = "Present";
            Id                   = "3a2c62db-5318-420d-8d74-23affee5d9d5";
            IsEnabled            = $True;
            Managedidentity      = $False;
            ResourceScopes       = @("/");
            RolePermissions      = @("microsoft.directory/bitlockerKeys/key/read","microsoft.directory/contacts/create","microsoft.directory/contacts/delete","microsoft.directory/contacts/basic/update","microsoft.directory/deletedItems.devices/delete","microsoft.directory/deletedItems.devices/restore","microsoft.directory/devices/create","microsoft.directory/devices/delete","microsoft.directory/devices/disable","microsoft.directory/devices/enable","microsoft.directory/devices/basic/update","microsoft.directory/devices/extensionAttributeSet1/update","microsoft.directory/devices/extensionAttributeSet2/update","microsoft.directory/devices/extensionAttributeSet3/update","microsoft.directory/devices/registeredOwners/update","microsoft.directory/devices/registeredUsers/update","microsoft.directory/deviceManagementPolicies/standard/read","microsoft.directory/deviceRegistrationPolicy/standard/read","microsoft.directory/groups/hiddenMembers/read","microsoft.directory/groups.security/create","microsoft.directory/groups.security/delete","microsoft.directory/groups.security/basic/update","microsoft.directory/groups.security/classification/update","microsoft.directory/groups.security/dynamicMembershipRule/update","microsoft.directory/groups.security/members/update","microsoft.directory/groups.security/owners/update","microsoft.directory/groups.security/visibility/update","microsoft.directory/users/basic/update","microsoft.directory/users/manager/update","microsoft.directory/users/photo/update","microsoft.azure.supportTickets/allEntities/allTasks","microsoft.cloudPC/allEntities/allProperties/allTasks","microsoft.intune/allEntities/allTasks","microsoft.office365.organizationalMessages/allEntities/allProperties/read","microsoft.office365.supportTickets/allEntities/allTasks","microsoft.office365.webPortal/allEntities/standard/read");
            TemplateId           = "3a2c62db-5318-420d-8d74-23affee5d9d5";
            Version              = "1";
        }
        AADRoleDefinition d4bb5077-b744-4119-a3da-9d4c34e68579
        {
            Credential           = $Credscredential;
            Description          = "Can create and manage all aspects of app registrations and enterprise apps except App Proxy.";
            DisplayName          = "Cloud Application Administrator";
            Ensure               = "Present";
            Id                   = "158c047a-c907-4556-b7ef-446551a6b5f7";
            IsEnabled            = $True;
            Managedidentity      = $False;
            ResourceScopes       = @("/");
            RolePermissions      = @("microsoft.directory/adminConsentRequestPolicy/allProperties/allTasks","microsoft.directory/appConsent/appConsentRequests/allProperties/read","microsoft.directory/applications/create","microsoft.directory/applications/delete","microsoft.directory/applications/appRoles/update","microsoft.directory/applications/audience/update","microsoft.directory/applications/authentication/update","microsoft.directory/applications/basic/update","microsoft.directory/applications/credentials/update","microsoft.directory/applications/extensionProperties/update","microsoft.directory/applications/notes/update","microsoft.directory/applications/owners/update","microsoft.directory/applications/permissions/update","microsoft.directory/applications/policies/update","microsoft.directory/applications/tag/update","microsoft.directory/applications/verification/update","microsoft.directory/applications/synchronization/standard/read","microsoft.directory/applicationTemplates/instantiate","microsoft.directory/auditLogs/allProperties/read","microsoft.directory/deletedItems.applications/delete","microsoft.directory/deletedItems.applications/restore","microsoft.directory/oAuth2PermissionGrants/allProperties/allTasks","microsoft.directory/applicationPolicies/create","microsoft.directory/applicationPolicies/delete","microsoft.directory/applicationPolicies/standard/read","microsoft.directory/applicationPolicies/owners/read","microsoft.directory/applicationPolicies/policyAppliedTo/read","microsoft.directory/applicationPolicies/basic/update","microsoft.directory/applicationPolicies/owners/update","microsoft.directory/provisioningLogs/allProperties/read","microsoft.directory/servicePrincipals/create","microsoft.directory/servicePrincipals/delete","microsoft.directory/servicePrincipals/disable","microsoft.directory/servicePrincipals/enable","microsoft.directory/servicePrincipals/getPasswordSingleSignOnCredentials","microsoft.directory/servicePrincipals/synchronizationCredentials/manage","microsoft.directory/servicePrincipals/synchronizationJobs/manage","microsoft.directory/servicePrincipals/synchronizationSchema/manage","microsoft.directory/servicePrincipals/managePasswordSingleSignOnCredentials","microsoft.directory/servicePrincipals/managePermissionGrantsForAll.microsoft-application-admin","microsoft.directory/servicePrincipals/appRoleAssignedTo/update","microsoft.directory/servicePrincipals/audience/update","microsoft.directory/servicePrincipals/authentication/update","microsoft.directory/servicePrincipals/basic/update","microsoft.directory/servicePrincipals/credentials/update","microsoft.directory/servicePrincipals/notes/update","microsoft.directory/servicePrincipals/owners/update","microsoft.directory/servicePrincipals/permissions/update","microsoft.directory/servicePrincipals/policies/update","microsoft.directory/servicePrincipals/tag/update","microsoft.directory/servicePrincipals/synchronization/standard/read","microsoft.directory/signInReports/allProperties/read","microsoft.azure.serviceHealth/allEntities/allTasks","microsoft.azure.supportTickets/allEntities/allTasks","microsoft.office365.serviceHealth/allEntities/allTasks","microsoft.office365.supportTickets/allEntities/allTasks","microsoft.office365.webPortal/allEntities/standard/read");
            TemplateId           = "158c047a-c907-4556-b7ef-446551a6b5f7";
            Version              = "1";
        }
        AADRoleDefinition aefa2af4-5641-4e57-b151-e9f245e46733
        {
            Credential           = $Credscredential;
            Description          = "Can approve Microsoft support requests to access customer organizational data.";
            DisplayName          = "Customer LockBox Access Approver";
            Ensure               = "Present";
            Id                   = "5c4f9dcd-47dc-4cf7-8c9a-9e4207cbfc91";
            IsEnabled            = $True;
            Managedidentity      = $False;
            ResourceScopes       = @("/");
            RolePermissions      = @("microsoft.office365.lockbox/allEntities/allTasks","microsoft.office365.webPortal/allEntities/standard/read");
            TemplateId           = "5c4f9dcd-47dc-4cf7-8c9a-9e4207cbfc91";
            Version              = "1";
        }
        AADRoleDefinition 410902f7-32d9-4fc4-b3fe-9f3c6c57f80c
        {
            Credential           = $Credscredential;
            Description          = "Can manage all aspects of the Dynamics 365 product.";
            DisplayName          = "Dynamics 365 Administrator";
            Ensure               = "Present";
            Id                   = "44367163-eba1-44c3-98af-f5787879f96a";
            IsEnabled            = $True;
            Managedidentity      = $False;
            ResourceScopes       = @("/");
            RolePermissions      = @("microsoft.azure.serviceHealth/allEntities/allTasks","microsoft.azure.supportTickets/allEntities/allTasks","microsoft.dynamics365/allEntities/allTasks","microsoft.office365.serviceHealth/allEntities/allTasks","microsoft.office365.supportTickets/allEntities/allTasks","microsoft.office365.webPortal/allEntities/standard/read");
            TemplateId           = "44367163-eba1-44c3-98af-f5787879f96a";
            Version              = "1";
        }
        AADRoleDefinition b4e471b4-397c-4f74-8e2a-487fb272b7c0
        {
            Credential           = $Credscredential;
            Description          = "Can manage all aspects of the Power BI product.";
            DisplayName          = "Power BI Administrator";
            Ensure               = "Present";
            Id                   = "a9ea8996-122f-4c74-9520-8edcd192826c";
            IsEnabled            = $True;
            Managedidentity      = $False;
            ResourceScopes       = @("/");
            RolePermissions      = @("microsoft.azure.serviceHealth/allEntities/allTasks","microsoft.azure.supportTickets/allEntities/allTasks","microsoft.office365.serviceHealth/allEntities/allTasks","microsoft.office365.supportTickets/allEntities/allTasks","microsoft.office365.webPortal/allEntities/standard/read","microsoft.powerApps.powerBI/allEntities/allTasks");
            TemplateId           = "a9ea8996-122f-4c74-9520-8edcd192826c";
            Version              = "1";
        }
        AADRoleDefinition deb857d9-1b75-4337-82e3-a02b64277176
        {
            Credential           = $Credscredential;
            Description          = "Can manage Conditional Access capabilities.";
            DisplayName          = "Conditional Access Administrator";
            Ensure               = "Present";
            Id                   = "b1be1c3e-b65d-4f19-8427-f6fa0d97feb9";
            IsEnabled            = $True;
            Managedidentity      = $False;
            ResourceScopes       = @("/");
            RolePermissions      = @("microsoft.directory/namedLocations/create","microsoft.directory/namedLocations/delete","microsoft.directory/namedLocations/standard/read","microsoft.directory/namedLocations/basic/update","microsoft.directory/conditionalAccessPolicies/create","microsoft.directory/conditionalAccessPolicies/delete","microsoft.directory/conditionalAccessPolicies/standard/read","microsoft.directory/conditionalAccessPolicies/owners/read","microsoft.directory/conditionalAccessPolicies/policyAppliedTo/read","microsoft.directory/conditionalAccessPolicies/basic/update","microsoft.directory/conditionalAccessPolicies/owners/update","microsoft.directory/conditionalAccessPolicies/tenantDefault/update","microsoft.directory/resourceNamespaces/resourceActions/authenticationContext/update");
            TemplateId           = "b1be1c3e-b65d-4f19-8427-f6fa0d97feb9";
            Version              = "1";
        }
        AADRoleDefinition 8f882e90-f61a-4e33-9910-9e2eed2d582a
        {
            Credential           = $Credscredential;
            Description          = "Can read sign-in and audit reports.";
            DisplayName          = "Reports Reader";
            Ensure               = "Present";
            Id                   = "4a5d8f65-41da-4de4-8968-e035b65339cf";
            IsEnabled            = $True;
            Managedidentity      = $False;
            ResourceScopes       = @("/");
            RolePermissions      = @("microsoft.directory/auditLogs/allProperties/read","microsoft.directory/provisioningLogs/allProperties/read","microsoft.directory/signInReports/allProperties/read","microsoft.azure.serviceHealth/allEntities/allTasks","microsoft.office365.network/performance/allProperties/read","microsoft.office365.usageReports/allEntities/allProperties/read","microsoft.office365.webPortal/allEntities/standard/read");
            TemplateId           = "4a5d8f65-41da-4de4-8968-e035b65339cf";
            Version              = "1";
        }
        AADRoleDefinition cac8768f-cb6b-489a-89ea-4cd32c9bb3ae
        {
            Credential           = $Credscredential;
            Description          = "Can read messages and updates for their organization in Office 365 Message Center only.";
            DisplayName          = "Message Center Reader";
            Ensure               = "Present";
            Id                   = "790c1fb9-7f7d-4f88-86a1-ef1f95c05c1b";
            IsEnabled            = $True;
            Managedidentity      = $False;
            ResourceScopes       = @("/");
            RolePermissions      = @("microsoft.office365.messageCenter/messages/read","microsoft.office365.webPortal/allEntities/standard/read");
            TemplateId           = "790c1fb9-7f7d-4f88-86a1-ef1f95c05c1b";
            Version              = "1";
        }
        AADRoleDefinition 6f9d73e6-0e6b-4c6d-a3a2-cb900aa18c0c
        {
            Credential           = $Credscredential;
            Description          = "Can manage all aspects of the Azure Information Protection product.";
            DisplayName          = "Azure Information Protection Administrator";
            Ensure               = "Present";
            Id                   = "7495fdc4-34c4-4d15-a289-98788ce399fd";
            IsEnabled            = $True;
            Managedidentity      = $False;
            ResourceScopes       = @("/");
            RolePermissions      = @("microsoft.directory/authorizationPolicy/standard/read","microsoft.azure.informationProtection/allEntities/allTasks","microsoft.azure.serviceHealth/allEntities/allTasks","microsoft.azure.supportTickets/allEntities/allTasks","microsoft.office365.serviceHealth/allEntities/allTasks","microsoft.office365.supportTickets/allEntities/allTasks","microsoft.office365.webPortal/allEntities/standard/read");
            TemplateId           = "7495fdc4-34c4-4d15-a289-98788ce399fd";
            Version              = "1";
        }
        AADRoleDefinition 01f51d39-c4a4-4a01-acaa-3923d1fd1afd
        {
            Credential           = $Credscredential;
            Description          = "Can access and manage Desktop management tools and services.";
            DisplayName          = "Desktop Analytics Administrator";
            Ensure               = "Present";
            Id                   = "38a96431-2bdf-4b4c-8b6e-5d3d8abac1a4";
            IsEnabled            = $True;
            Managedidentity      = $False;
            ResourceScopes       = @("/");
            RolePermissions      = @("microsoft.directory/authorizationPolicy/standard/read","microsoft.azure.serviceHealth/allEntities/allTasks","microsoft.azure.supportTickets/allEntities/allTasks","microsoft.office365.desktopAnalytics/allEntities/allTasks");
            TemplateId           = "38a96431-2bdf-4b4c-8b6e-5d3d8abac1a4";
            Version              = "1";
        }
        AADRoleDefinition 56c93f65-a284-43db-b2ae-822617a724b9
        {
            Credential           = $Credscredential;
            Description          = "Can manage product licenses on users and groups.";
            DisplayName          = "License Administrator";
            Ensure               = "Present";
            Id                   = "4d6ac14f-3453-41d0-bef9-a3e0c569773a";
            IsEnabled            = $True;
            Managedidentity      = $False;
            ResourceScopes       = @("/");
            RolePermissions      = @("microsoft.directory/authorizationPolicy/standard/read","microsoft.directory/groups/assignLicense","microsoft.directory/groups/reprocessLicenseAssignment","microsoft.directory/users/assignLicense","microsoft.directory/users/reprocessLicenseAssignment","microsoft.directory/users/usageLocation/update","microsoft.azure.serviceHealth/allEntities/allTasks","microsoft.office365.serviceHealth/allEntities/allTasks","microsoft.office365.webPortal/allEntities/standard/read");
            TemplateId           = "4d6ac14f-3453-41d0-bef9-a3e0c569773a";
            Version              = "1";
        }
        AADRoleDefinition 6f39485b-8d14-4190-acc2-b0ddf6da8f2a
        {
            Credential           = $Credscredential;
            Description          = "Limited access to manage devices in Azure AD.";
            DisplayName          = "Cloud Device Administrator";
            Ensure               = "Present";
            Id                   = "7698a772-787b-4ac8-901f-60d6b08affd2";
            IsEnabled            = $True;
            Managedidentity      = $False;
            ResourceScopes       = @("/");
            RolePermissions      = @("microsoft.directory/auditLogs/allProperties/read","microsoft.directory/authorizationPolicy/standard/read","microsoft.directory/bitlockerKeys/key/read","microsoft.directory/deletedItems.devices/delete","microsoft.directory/deletedItems.devices/restore","microsoft.directory/devices/delete","microsoft.directory/devices/disable","microsoft.directory/devices/enable","microsoft.directory/deviceManagementPolicies/standard/read","microsoft.directory/deviceManagementPolicies/basic/update","microsoft.directory/deviceRegistrationPolicy/standard/read","microsoft.directory/deviceRegistrationPolicy/basic/update","microsoft.directory/signInReports/allProperties/read","microsoft.azure.serviceHealth/allEntities/allTasks","microsoft.office365.serviceHealth/allEntities/allTasks");
            TemplateId           = "7698a772-787b-4ac8-901f-60d6b08affd2";
            Version              = "1";
        }
        AADRoleDefinition 619033d4-4733-4ae1-bbc7-a35c3e3bec58
        {
            Credential           = $Credscredential;
            Description          = "Can access to view, set and reset authentication method information for any non-admin user.";
            DisplayName          = "Authentication Administrator";
            Ensure               = "Present";
            Id                   = "c4e39bd9-1100-46d3-8c65-fb160da0071f";
            IsEnabled            = $True;
            Managedidentity      = $False;
            ResourceScopes       = @("/");
            RolePermissions      = @("microsoft.directory/users/authenticationMethods/create","microsoft.directory/users/authenticationMethods/delete","microsoft.directory/users/authenticationMethods/standard/restrictedRead","microsoft.directory/users/authenticationMethods/basic/update","microsoft.directory/deletedItems.users/restore","microsoft.directory/users/delete","microsoft.directory/users/disable","microsoft.directory/users/enable","microsoft.directory/users/invalidateAllRefreshTokens","microsoft.directory/users/restore","microsoft.directory/users/basic/update","microsoft.directory/users/manager/update","microsoft.directory/users/password/update","microsoft.directory/users/userPrincipalName/update","microsoft.azure.serviceHealth/allEntities/allTasks","microsoft.azure.supportTickets/allEntities/allTasks","microsoft.office365.serviceHealth/allEntities/allTasks","microsoft.office365.supportTickets/allEntities/allTasks","microsoft.office365.webPortal/allEntities/standard/read");
            TemplateId           = "c4e39bd9-1100-46d3-8c65-fb160da0071f";
            Version              = "1";
        }
        AADRoleDefinition c6a113e5-8efe-4a91-a4f4-07e13b620865
        {
            Credential           = $Credscredential;
            Description          = "Can access to view, set and reset authentication method information for any user (admin or non-admin).";
            DisplayName          = "Privileged Authentication Administrator";
            Ensure               = "Present";
            Id                   = "7be44c8a-adaf-4e2a-84d6-ab2649e08a13";
            IsEnabled            = $True;
            Managedidentity      = $False;
            ResourceScopes       = @("/");
            RolePermissions      = @("microsoft.directory/users/authenticationMethods/create","microsoft.directory/users/authenticationMethods/delete","microsoft.directory/users/authenticationMethods/standard/read","microsoft.directory/users/authenticationMethods/basic/update","microsoft.directory/deletedItems.users/restore","microsoft.directory/users/delete","microsoft.directory/users/disable","microsoft.directory/users/enable","microsoft.directory/users/invalidateAllRefreshTokens","microsoft.directory/users/restore","microsoft.directory/users/basic/update","microsoft.directory/users/manager/update","microsoft.directory/users/password/update","microsoft.directory/users/userPrincipalName/update","microsoft.azure.serviceHealth/allEntities/allTasks","microsoft.azure.supportTickets/allEntities/allTasks","microsoft.office365.serviceHealth/allEntities/allTasks","microsoft.office365.supportTickets/allEntities/allTasks","microsoft.office365.webPortal/allEntities/standard/read");
            TemplateId           = "7be44c8a-adaf-4e2a-84d6-ab2649e08a13";
            Version              = "1";
        }
        AADRoleDefinition 667d0b55-4c55-43ef-84d1-44b0d52ae8c7
        {
            Credential           = $Credscredential;
            Description          = "Can manage calling and meetings features within the Microsoft Teams service.";
            DisplayName          = "Teams Communications Administrator";
            Ensure               = "Present";
            Id                   = "baf37b3a-610e-45da-9e62-d9d1e5e8914b";
            IsEnabled            = $True;
            Managedidentity      = $False;
            ResourceScopes       = @("/");
            RolePermissions      = @("microsoft.directory/authorizationPolicy/standard/read","microsoft.azure.serviceHealth/allEntities/allTasks","microsoft.azure.supportTickets/allEntities/allTasks","microsoft.office365.serviceHealth/allEntities/allTasks","microsoft.office365.skypeForBusiness/allEntities/allTasks","microsoft.office365.supportTickets/allEntities/allTasks","microsoft.office365.usageReports/allEntities/allProperties/read","microsoft.office365.webPortal/allEntities/standard/read","microsoft.teams/callQuality/allProperties/read","microsoft.teams/meetings/allProperties/allTasks","microsoft.teams/voice/allProperties/allTasks");
            TemplateId           = "baf37b3a-610e-45da-9e62-d9d1e5e8914b";
            Version              = "1";
        }
        AADRoleDefinition 4421be6f-9af0-4dc6-9936-5cebb51750f5
        {
            Credential           = $Credscredential;
            Description          = "Can troubleshoot communications issues within Teams using advanced tools.";
            DisplayName          = "Teams Communications Support Engineer";
            Ensure               = "Present";
            Id                   = "f70938a0-fc10-4177-9e90-2178f8765737";
            IsEnabled            = $True;
            Managedidentity      = $False;
            ResourceScopes       = @("/");
            RolePermissions      = @("microsoft.directory/authorizationPolicy/standard/read","microsoft.azure.serviceHealth/allEntities/allTasks","microsoft.office365.serviceHealth/allEntities/allTasks","microsoft.office365.skypeForBusiness/allEntities/allTasks","microsoft.office365.webPortal/allEntities/standard/read","microsoft.teams/callQuality/allProperties/read");
            TemplateId           = "f70938a0-fc10-4177-9e90-2178f8765737";
            Version              = "1";
        }
        AADRoleDefinition 24148e67-4e1c-4091-accd-a9f57abe3b8a
        {
            Credential           = $Credscredential;
            Description          = "Can troubleshoot communications issues within Teams using basic tools.";
            DisplayName          = "Teams Communications Support Specialist";
            Ensure               = "Present";
            Id                   = "fcf91098-03e3-41a9-b5ba-6f0ec8188a12";
            IsEnabled            = $True;
            Managedidentity      = $False;
            ResourceScopes       = @("/");
            RolePermissions      = @("microsoft.directory/authorizationPolicy/standard/read","microsoft.azure.serviceHealth/allEntities/allTasks","microsoft.office365.serviceHealth/allEntities/allTasks","microsoft.office365.skypeForBusiness/allEntities/allTasks","microsoft.office365.webPortal/allEntities/standard/read","microsoft.teams/callQuality/standard/read");
            TemplateId           = "fcf91098-03e3-41a9-b5ba-6f0ec8188a12";
            Version              = "1";
        }
        AADRoleDefinition 975e1d0f-48a3-4cce-8e57-f4713b1a427e
        {
            Credential           = $Credscredential;
            Description          = "Can manage the Microsoft Teams service.";
            DisplayName          = "Teams Administrator";
            Ensure               = "Present";
            Id                   = "69091246-20e8-4a56-aa4d-066075b2a7a8";
            IsEnabled            = $True;
            Managedidentity      = $False;
            ResourceScopes       = @("/");
            RolePermissions      = @("microsoft.directory/authorizationPolicy/standard/read","microsoft.directory/groups/hiddenMembers/read","microsoft.directory/groups.unified/create","microsoft.directory/groups.unified/delete","microsoft.directory/groups.unified/restore","microsoft.directory/groups.unified/basic/update","microsoft.directory/groups.unified/members/update","microsoft.directory/groups.unified/owners/update","microsoft.azure.serviceHealth/allEntities/allTasks","microsoft.azure.supportTickets/allEntities/allTasks","microsoft.office365.network/performance/allProperties/read","microsoft.office365.serviceHealth/allEntities/allTasks","microsoft.office365.skypeForBusiness/allEntities/allTasks","microsoft.office365.supportTickets/allEntities/allTasks","microsoft.office365.usageReports/allEntities/allProperties/read","microsoft.office365.webPortal/allEntities/standard/read","microsoft.teams/allEntities/allProperties/allTasks","microsoft.directory/crossTenantAccessPolicy/standard/read","microsoft.directory/crossTenantAccessPolicy/allowedCloudEndpoints/update","microsoft.directory/crossTenantAccessPolicy/default/standard/read","microsoft.directory/crossTenantAccessPolicy/default/crossCloudMeetings/update","microsoft.directory/crossTenantAccessPolicy/partners/create","microsoft.directory/crossTenantAccessPolicy/partners/standard/read","microsoft.directory/crossTenantAccessPolicy/partners/crossCloudMeetings/update");
            TemplateId           = "69091246-20e8-4a56-aa4d-066075b2a7a8";
            Version              = "1";
        }
        AADRoleDefinition fd58cc44-a34e-4cc6-9c1d-06ff3c334491
        {
            Credential           = $Credscredential;
            Description          = "Has administrative access in the Microsoft 365 Insights app.";
            DisplayName          = "Insights Administrator";
            Ensure               = "Present";
            Id                   = "eb1f4a8d-243a-41f0-9fbd-c7cdf6c5ef7c";
            IsEnabled            = $True;
            Managedidentity      = $False;
            ResourceScopes       = @("/");
            RolePermissions      = @("microsoft.azure.serviceHealth/allEntities/allTasks","microsoft.azure.supportTickets/allEntities/allTasks","microsoft.insights/allEntities/allProperties/allTasks","microsoft.office365.serviceHealth/allEntities/allTasks","microsoft.office365.supportTickets/allEntities/allTasks","microsoft.office365.webPortal/allEntities/standard/read");
            TemplateId           = "eb1f4a8d-243a-41f0-9fbd-c7cdf6c5ef7c";
            Version              = "1";
        }
        AADRoleDefinition 541fe8a0-ca47-4bb3-9779-b55ed34c3eda
        {
            Credential           = $Credscredential;
            Description          = "Can read security messages and updates in Office 365 Message Center only.";
            DisplayName          = "Message Center Privacy Reader";
            Ensure               = "Present";
            Id                   = "ac16e43d-7b2d-40e0-ac05-243ff356ab5b";
            IsEnabled            = $True;
            Managedidentity      = $False;
            ResourceScopes       = @("/");
            RolePermissions      = @("microsoft.office365.messageCenter/messages/read","microsoft.office365.messageCenter/securityMessages/read","microsoft.office365.webPortal/allEntities/standard/read");
            TemplateId           = "ac16e43d-7b2d-40e0-ac05-243ff356ab5b";
            Version              = "1";
        }
        AADRoleDefinition e2e66322-81c5-46aa-8e31-843cba35cb95
        {
            Credential           = $Credscredential;
            Description          = "Can create and manage all aspects of user flows.";
            DisplayName          = "External ID User Flow Administrator";
            Ensure               = "Present";
            Id                   = "6e591065-9bad-43ed-90f3-e9424366d2f0";
            IsEnabled            = $True;
            Managedidentity      = $False;
            ResourceScopes       = @("/");
            RolePermissions      = "microsoft.directory/b2cUserFlow/allProperties/allTasks";
            TemplateId           = "6e591065-9bad-43ed-90f3-e9424366d2f0";
            Version              = "1";
        }
        AADRoleDefinition db738a41-5f51-472f-8089-3e5f14ffb247
        {
            Credential           = $Credscredential;
            Description          = "Can create and manage the attribute schema available to all user flows.";
            DisplayName          = "External ID User Flow Attribute Administrator";
            Ensure               = "Present";
            Id                   = "0f971eea-41eb-4569-a71e-57bb8a3eff1e";
            IsEnabled            = $True;
            Managedidentity      = $False;
            ResourceScopes       = @("/");
            RolePermissions      = "microsoft.directory/b2cUserAttribute/allProperties/allTasks";
            TemplateId           = "0f971eea-41eb-4569-a71e-57bb8a3eff1e";
            Version              = "1";
        }
        AADRoleDefinition de1944d9-5d2c-4de2-8bb7-e0990affd7e2
        {
            Credential           = $Credscredential;
            Description          = "Can manage secrets for federation and encryption in the Identity Experience Framework (IEF).";
            DisplayName          = "B2C IEF Keyset Administrator";
            Ensure               = "Present";
            Id                   = "aaf43236-0c0d-4d5f-883a-6955382ac081";
            IsEnabled            = $True;
            Managedidentity      = $False;
            ResourceScopes       = @("/");
            RolePermissions      = "microsoft.directory/b2cTrustFrameworkKeySet/allProperties/allTasks";
            TemplateId           = "aaf43236-0c0d-4d5f-883a-6955382ac081";
            Version              = "1";
        }
        AADRoleDefinition 281bff0e-7130-4cf1-872a-06d33900973a
        {
            Credential           = $Credscredential;
            Description          = "Can create and manage trust framework policies in the Identity Experience Framework (IEF).";
            DisplayName          = "B2C IEF Policy Administrator";
            Ensure               = "Present";
            Id                   = "3edaf663-341e-4475-9f94-5c398ef6c070";
            IsEnabled            = $True;
            Managedidentity      = $False;
            ResourceScopes       = @("/");
            RolePermissions      = "microsoft.directory/b2cTrustFrameworkPolicy/allProperties/allTasks";
            TemplateId           = "3edaf663-341e-4475-9f94-5c398ef6c070";
            Version              = "1";
        }
        AADRoleDefinition be4df44f-d0f8-49a0-80f0-a14ef7155a24
        {
            Credential           = $Credscredential;
            Description          = "Can configure identity providers for use in direct federation.";
            DisplayName          = "External Identity Provider Administrator";
            Ensure               = "Present";
            Id                   = "be2f45a1-457d-42af-a067-6ec1fa63bc45";
            IsEnabled            = $True;
            Managedidentity      = $False;
            ResourceScopes       = @("/");
            RolePermissions      = @("microsoft.directory/domains/federation/update","microsoft.directory/identityProviders/allProperties/allTasks");
            TemplateId           = "be2f45a1-457d-42af-a067-6ec1fa63bc45";
            Version              = "1";
        }
        AADRoleDefinition 6b8a3576-040b-420f-ab04-c035490fd4a8
        {
            Credential           = $Credscredential;
            Description          = "Creates and manages compliance content.";
            DisplayName          = "Compliance Data Administrator";
            Ensure               = "Present";
            Id                   = "e6d1a23a-da11-4be4-9570-befc86d067a7";
            IsEnabled            = $True;
            Managedidentity      = $False;
            ResourceScopes       = @("/");
            RolePermissions      = @("microsoft.directory/authorizationPolicy/standard/read","microsoft.directory/cloudAppSecurity/allProperties/allTasks","microsoft.azure.informationProtection/allEntities/allTasks","microsoft.azure.serviceHealth/allEntities/allTasks","microsoft.azure.supportTickets/allEntities/allTasks","microsoft.office365.complianceManager/allEntities/allTasks","microsoft.office365.serviceHealth/allEntities/allTasks","microsoft.office365.supportTickets/allEntities/allTasks","microsoft.office365.webPortal/allEntities/standard/read");
            TemplateId           = "e6d1a23a-da11-4be4-9570-befc86d067a7";
            Version              = "1";
        }
        AADRoleDefinition 4e84b393-8c9e-47f7-802e-92b8f08c6cc6
        {
            Credential           = $Credscredential;
            Description          = "Creates and manages security events.";
            DisplayName          = "Security Operator";
            Ensure               = "Present";
            Id                   = "5f2222b1-57c3-48ba-8ad5-d4759f1fde6f";
            IsEnabled            = $True;
            Managedidentity      = $False;
            ResourceScopes       = @("/");
            RolePermissions      = @("microsoft.directory/auditLogs/allProperties/read","microsoft.directory/authorizationPolicy/standard/read","microsoft.directory/cloudAppSecurity/allProperties/allTasks","microsoft.directory/identityProtection/allProperties/allTasks","microsoft.directory/privilegedIdentityManagement/allProperties/read","microsoft.directory/provisioningLogs/allProperties/read","microsoft.directory/signInReports/allProperties/read","microsoft.azure.advancedThreatProtection/allEntities/allTasks","microsoft.azure.supportTickets/allEntities/allTasks","microsoft.intune/allEntities/read","microsoft.office365.securityComplianceCenter/allEntities/allTasks","microsoft.office365.supportTickets/allEntities/allTasks","microsoft.windows.defenderAdvancedThreatProtection/allEntities/allTasks");
            TemplateId           = "5f2222b1-57c3-48ba-8ad5-d4759f1fde6f";
            Version              = "1";
        }
        AADRoleDefinition 20960823-5913-4f53-9915-40bca007e632
        {
            Credential           = $Credscredential;
            Description          = "Can manage settings for Microsoft Kaizala.";
            DisplayName          = "Kaizala Administrator";
            Ensure               = "Present";
            Id                   = "74ef975b-6605-40af-a5d2-b9539d836353";
            IsEnabled            = $True;
            Managedidentity      = $False;
            ResourceScopes       = @("/");
            RolePermissions      = @("microsoft.directory/authorizationPolicy/standard/read","microsoft.office365.serviceHealth/allEntities/allTasks","microsoft.office365.supportTickets/allEntities/allTasks","microsoft.office365.webPortal/allEntities/standard/read");
            TemplateId           = "74ef975b-6605-40af-a5d2-b9539d836353";
            Version              = "1";
        }
        AADRoleDefinition 32dddafb-1c6d-4d33-9c76-18ce03f9dfce
        {
            Credential           = $Credscredential;
            Description          = "Can read everything that a Global Administrator can, but not update anything.";
            DisplayName          = "Global Reader";
            Ensure               = "Present";
            Id                   = "f2ef992c-3afb-46b9-b7cf-a126ee74c451";
            IsEnabled            = $True;
            Managedidentity      = $False;
            ResourceScopes       = @("/");
            RolePermissions      = @("microsoft.directory/accessReviews/allProperties/read","microsoft.directory/accessReviews/definitions/allProperties/read","microsoft.directory/adminConsentRequestPolicy/allProperties/read","microsoft.directory/administrativeUnits/allProperties/read","microsoft.directory/appConsent/appConsentRequests/allProperties/read","microsoft.directory/applications/allProperties/read","microsoft.directory/applications/synchronization/standard/read","microsoft.directory/auditLogs/allProperties/read","microsoft.directory/users/authenticationMethods/standard/restrictedRead","microsoft.directory/authorizationPolicy/standard/read","microsoft.directory/bitlockerKeys/key/read","microsoft.directory/cloudAppSecurity/allProperties/read","microsoft.directory/connectors/allProperties/read","microsoft.directory/connectorGroups/allProperties/read","microsoft.directory/contacts/allProperties/read","microsoft.directory/customAuthenticationExtensions/allProperties/read","microsoft.directory/devices/allProperties/read","microsoft.directory/directoryRoles/allProperties/read","microsoft.directory/directoryRoleTemplates/allProperties/read","microsoft.directory/domains/allProperties/read","microsoft.directory/entitlementManagement/allProperties/read","microsoft.directory/groups/allProperties/read","microsoft.directory/groupSettings/allProperties/read","microsoft.directory/groupSettingTemplates/allProperties/read","microsoft.directory/identityProtection/allProperties/read","microsoft.directory/loginOrganizationBranding/allProperties/read","microsoft.directory/namedLocations/standard/read","microsoft.directory/oAuth2PermissionGrants/allProperties/read","microsoft.directory/organization/allProperties/read","microsoft.directory/permissionGrantPolicies/standard/read","microsoft.directory/policies/allProperties/read","microsoft.directory/conditionalAccessPolicies/allProperties/read","microsoft.directory/crossTenantAccessPolicy/standard/read","microsoft.directory/crossTenantAccessPolicy/default/standard/read","microsoft.directory/crossTenantAccessPolicy/partners/standard/read","microsoft.directory/deviceManagementPolicies/standard/read","microsoft.directory/deviceRegistrationPolicy/standard/read","microsoft.directory/privilegedIdentityManagement/allProperties/read","microsoft.directory/provisioningLogs/allProperties/read","microsoft.directory/roleAssignments/allProperties/read","microsoft.directory/roleDefinitions/allProperties/read","microsoft.directory/scopedRoleMemberships/allProperties/read","microsoft.directory/serviceAction/getAvailableExtentionProperties","microsoft.directory/servicePrincipals/allProperties/read","microsoft.directory/servicePrincipalCreationPolicies/standard/read","microsoft.directory/servicePrincipals/synchronization/standard/read","microsoft.directory/signInReports/allProperties/read","microsoft.directory/subscribedSkus/allProperties/read","microsoft.directory/users/allProperties/read","microsoft.directory/verifiableCredentials/configuration/contracts/cards/allProperties/read","microsoft.directory/verifiableCredentials/configuration/contracts/allProperties/read","microsoft.directory/verifiableCredentials/configuration/allProperties/read","microsoft.directory/lifecycleWorkflows/workflows/allProperties/read","microsoft.cloudPC/allEntities/allProperties/read","microsoft.commerce.billing/allEntities/allProperties/read","microsoft.commerce.billing/purchases/standard/read","microsoft.edge/allEntities/allProperties/read","microsoft.hardware.support/shippingAddress/allProperties/read","microsoft.hardware.support/shippingStatus/allProperties/read","microsoft.hardware.support/warrantyClaims/allProperties/read","microsoft.insights/allEntities/allProperties/read","microsoft.office365.messageCenter/messages/read","microsoft.office365.messageCenter/securityMessages/read","microsoft.office365.network/performance/allProperties/read","microsoft.office365.organizationalMessages/allEntities/allProperties/read","microsoft.office365.protectionCenter/allEntities/allProperties/read","microsoft.office365.securityComplianceCenter/allEntities/read","microsoft.office365.usageReports/allEntities/allProperties/read","microsoft.office365.webPortal/allEntities/standard/read","microsoft.office365.yammer/allEntities/allProperties/read","microsoft.permissionsManagement/allEntities/allProperties/read","microsoft.teams/allEntities/allProperties/read","microsoft.virtualVisits/allEntities/allProperties/read","microsoft.windows.updatesDeployments/allEntities/allProperties/read");
            TemplateId           = "f2ef992c-3afb-46b9-b7cf-a126ee74c451";
            Version              = "1";
        }
        AADRoleDefinition 7b721742-9ccc-45d5-b4bc-7b8c41e40abd
        {
            Credential           = $Credscredential;
            Description          = "Can create and manage all aspects of Microsoft Search settings.";
            DisplayName          = "Search Administrator";
            Ensure               = "Present";
            Id                   = "0964bb5e-9bdb-4d7b-ac29-58e794862a40";
            IsEnabled            = $True;
            Managedidentity      = $False;
            ResourceScopes       = @("/");
            RolePermissions      = @("microsoft.office365.messageCenter/messages/read","microsoft.office365.search/content/manage","microsoft.office365.serviceHealth/allEntities/allTasks","microsoft.office365.supportTickets/allEntities/allTasks","microsoft.office365.webPortal/allEntities/standard/read");
            TemplateId           = "0964bb5e-9bdb-4d7b-ac29-58e794862a40";
            Version              = "1";
        }
        AADRoleDefinition 601c0269-2960-4740-abad-f9a4a8c21a62
        {
            Credential           = $Credscredential;
            Description          = "Can create and manage the editorial content such as bookmarks, Q and As, locations, floorplan.";
            DisplayName          = "Search Editor";
            Ensure               = "Present";
            Id                   = "8835291a-918c-4fd7-a9ce-faa49f0cf7d9";
            IsEnabled            = $True;
            Managedidentity      = $False;
            ResourceScopes       = @("/");
            RolePermissions      = @("microsoft.office365.messageCenter/messages/read","microsoft.office365.search/content/manage","microsoft.office365.webPortal/allEntities/standard/read");
            TemplateId           = "8835291a-918c-4fd7-a9ce-faa49f0cf7d9";
            Version              = "1";
        }
        AADRoleDefinition d3592730-51e1-4b24-a37f-d95a2a52648c
        {
            Credential           = $Credscredential;
            Description          = "Can reset passwords for non-administrators and Password Administrators.";
            DisplayName          = "Password Administrator";
            Ensure               = "Present";
            Id                   = "966707d0-3269-4727-9be2-8c3a10f19b9d";
            IsEnabled            = $True;
            Managedidentity      = $False;
            ResourceScopes       = @("/");
            RolePermissions      = @("microsoft.directory/users/password/update","microsoft.office365.webPortal/allEntities/standard/read");
            TemplateId           = "966707d0-3269-4727-9be2-8c3a10f19b9d";
            Version              = "1";
        }
        AADRoleDefinition 0713a912-d088-4fbe-8369-a0747f47fe35
        {
            Credential           = $Credscredential;
            Description          = "Can manage all aspects of printers and printer connectors.";
            DisplayName          = "Printer Administrator";
            Ensure               = "Present";
            Id                   = "644ef478-e28f-4e28-b9dc-3fdde9aa0b1f";
            IsEnabled            = $True;
            Managedidentity      = $False;
            ResourceScopes       = @("/");
            RolePermissions      = "microsoft.azure.print/allEntities/allProperties/allTasks";
            TemplateId           = "644ef478-e28f-4e28-b9dc-3fdde9aa0b1f";
            Version              = "1";
        }
        AADRoleDefinition c3c25b4e-4204-4d61-9443-01c746c58f03
        {
            Credential           = $Credscredential;
            Description          = "Can register and unregister printers and update printer status.";
            DisplayName          = "Printer Technician";
            Ensure               = "Present";
            Id                   = "e8cef6f1-e4bd-4ea8-bc07-4b8d950f4477";
            IsEnabled            = $True;
            Managedidentity      = $False;
            ResourceScopes       = @("/");
            RolePermissions      = @("microsoft.azure.print/connectors/allProperties/read","microsoft.azure.print/printers/allProperties/read","microsoft.azure.print/printers/register","microsoft.azure.print/printers/unregister","microsoft.azure.print/printers/basic/update");
            TemplateId           = "e8cef6f1-e4bd-4ea8-bc07-4b8d950f4477";
            Version              = "1";
        }
        AADRoleDefinition d6cda540-c878-445e-a18b-c9b420079ea3
        {
            Credential           = $Credscredential;
            Description          = "Can create and manage the authentication methods policy, tenant-wide MFA settings, password protection policy, and verifiable credentials.";
            DisplayName          = "Authentication Policy Administrator";
            Ensure               = "Present";
            Id                   = "0526716b-113d-4c15-b2c8-68e3c22b9f80";
            IsEnabled            = $True;
            Managedidentity      = $False;
            ResourceScopes       = @("/");
            RolePermissions      = @("microsoft.directory/organization/strongAuthentication/allTasks","microsoft.directory/userCredentialPolicies/create","microsoft.directory/userCredentialPolicies/delete","microsoft.directory/userCredentialPolicies/standard/read","microsoft.directory/userCredentialPolicies/owners/read","microsoft.directory/userCredentialPolicies/policyAppliedTo/read","microsoft.directory/userCredentialPolicies/basic/update","microsoft.directory/userCredentialPolicies/owners/update","microsoft.directory/userCredentialPolicies/tenantDefault/update","microsoft.directory/verifiableCredentials/configuration/contracts/cards/allProperties/read","microsoft.directory/verifiableCredentials/configuration/contracts/cards/revoke","microsoft.directory/verifiableCredentials/configuration/contracts/create","microsoft.directory/verifiableCredentials/configuration/contracts/allProperties/read","microsoft.directory/verifiableCredentials/configuration/contracts/allProperties/update","microsoft.directory/verifiableCredentials/configuration/create","microsoft.directory/verifiableCredentials/configuration/delete","microsoft.directory/verifiableCredentials/configuration/allProperties/read","microsoft.directory/verifiableCredentials/configuration/allProperties/update","microsoft.azure.supportTickets/allEntities/allTasks");
            TemplateId           = "0526716b-113d-4c15-b2c8-68e3c22b9f80";
            Version              = "1";
        }
        AADRoleDefinition 6b53f85a-8fe2-4825-9124-82f96a720b69
        {
            Credential           = $Credscredential;
            Description          = "Members of this role can create/manage groups, create/manage groups settings like naming and expiration policies, and view groups activity and audit reports.";
            DisplayName          = "Groups Administrator";
            Ensure               = "Present";
            Id                   = "fdd7a751-b60b-444a-984c-02652fe8fa1c";
            IsEnabled            = $True;
            Managedidentity      = $False;
            ResourceScopes       = @("/");
            RolePermissions      = @("microsoft.directory/deletedItems.groups/delete","microsoft.directory/deletedItems.groups/restore","microsoft.directory/groups/assignLicense","microsoft.directory/groups/create","microsoft.directory/groups/delete","microsoft.directory/groups/hiddenMembers/read","microsoft.directory/groups/reprocessLicenseAssignment","microsoft.directory/groups/restore","microsoft.directory/groups/basic/update","microsoft.directory/groups/classification/update","microsoft.directory/groups/dynamicMembershipRule/update","microsoft.directory/groups/groupType/update","microsoft.directory/groups/members/update","microsoft.directory/groups/onPremWriteBack/update","microsoft.directory/groups/owners/update","microsoft.directory/groups/settings/update","microsoft.directory/groups/visibility/update","microsoft.azure.serviceHealth/allEntities/allTasks","microsoft.azure.supportTickets/allEntities/allTasks","microsoft.office365.serviceHealth/allEntities/allTasks","microsoft.office365.supportTickets/allEntities/allTasks","microsoft.office365.webPortal/allEntities/standard/read");
            TemplateId           = "fdd7a751-b60b-444a-984c-02652fe8fa1c";
            Version              = "1";
        }
        AADRoleDefinition 4a7e484b-c304-4726-b4c3-80ba134c6a0a
        {
            Credential           = $Credscredential;
            Description          = "Can create and manage all aspects of Microsoft Dynamics 365, PowerApps and Microsoft Flow.";
            DisplayName          = "Power Platform Administrator";
            Ensure               = "Present";
            Id                   = "11648597-926c-4cf3-9c36-bcebb0ba8dcc";
            IsEnabled            = $True;
            Managedidentity      = $False;
            ResourceScopes       = @("/");
            RolePermissions      = @("microsoft.azure.serviceHealth/allEntities/allTasks","microsoft.azure.supportTickets/allEntities/allTasks","microsoft.dynamics365/allEntities/allTasks","microsoft.flow/allEntities/allTasks","microsoft.office365.serviceHealth/allEntities/allTasks","microsoft.office365.supportTickets/allEntities/allTasks","microsoft.office365.webPortal/allEntities/standard/read","microsoft.powerApps/allEntities/allTasks");
            TemplateId           = "11648597-926c-4cf3-9c36-bcebb0ba8dcc";
            Version              = "1";
        }
        AADRoleDefinition 442b83b9-8a2e-4569-8b09-f6310dce1748
        {
            Credential           = $Credscredential;
            Description          = "Can manage Azure DevOps organization policy and settings.";
            DisplayName          = "Azure DevOps Administrator";
            Ensure               = "Present";
            Id                   = "e3973bdf-4987-49ae-837a-ba8e231c7286";
            IsEnabled            = $True;
            Managedidentity      = $False;
            ResourceScopes       = @("/");
            RolePermissions      = "microsoft.azure.devOps/allEntities/allTasks";
            TemplateId           = "e3973bdf-4987-49ae-837a-ba8e231c7286";
            Version              = "1";
        }
        AADRoleDefinition e87afd3a-b6a2-4f8c-bfba-b80f994c5d34
        {
            Credential           = $Credscredential;
            Description          = "Can manage AD to Azure AD cloud provisioning, Azure AD Connect, and federation settings.";
            DisplayName          = "Hybrid Identity Administrator";
            Ensure               = "Present";
            Id                   = "8ac3fc64-6eca-42ea-9e69-59f4c7b60eb2";
            IsEnabled            = $True;
            Managedidentity      = $False;
            ResourceScopes       = @("/");
            RolePermissions      = @("microsoft.directory/applications/create","microsoft.directory/applications/delete","microsoft.directory/applications/appRoles/update","microsoft.directory/applications/audience/update","microsoft.directory/applications/authentication/update","microsoft.directory/applications/basic/update","microsoft.directory/applications/notes/update","microsoft.directory/applications/owners/update","microsoft.directory/applications/permissions/update","microsoft.directory/applications/policies/update","microsoft.directory/applications/tag/update","microsoft.directory/applications/synchronization/standard/read","microsoft.directory/applicationTemplates/instantiate","microsoft.directory/auditLogs/allProperties/read","microsoft.directory/cloudProvisioning/allProperties/allTasks","microsoft.directory/deletedItems.applications/delete","microsoft.directory/deletedItems.applications/restore","microsoft.directory/domains/allProperties/read","microsoft.directory/domains/federation/update","microsoft.directory/hybridAuthenticationPolicy/allProperties/allTasks","microsoft.directory/organization/dirSync/update","microsoft.directory/passwordHashSync/allProperties/allTasks","microsoft.directory/provisioningLogs/allProperties/read","microsoft.directory/servicePrincipals/create","microsoft.directory/servicePrincipals/delete","microsoft.directory/servicePrincipals/disable","microsoft.directory/servicePrincipals/enable","microsoft.directory/servicePrincipals/synchronizationCredentials/manage","microsoft.directory/servicePrincipals/synchronizationJobs/manage","microsoft.directory/servicePrincipals/synchronizationSchema/manage","microsoft.directory/servicePrincipals/audience/update","microsoft.directory/servicePrincipals/authentication/update","microsoft.directory/servicePrincipals/basic/update","microsoft.directory/servicePrincipals/notes/update","microsoft.directory/servicePrincipals/owners/update","microsoft.directory/servicePrincipals/permissions/update","microsoft.directory/servicePrincipals/policies/update","microsoft.directory/servicePrincipals/tag/update","microsoft.directory/servicePrincipals/synchronization/standard/read","microsoft.directory/signInReports/allProperties/read","microsoft.azure.serviceHealth/allEntities/allTasks","microsoft.azure.supportTickets/allEntities/allTasks","microsoft.office365.messageCenter/messages/read","microsoft.office365.serviceHealth/allEntities/allTasks","microsoft.office365.supportTickets/allEntities/allTasks","microsoft.office365.webPortal/allEntities/standard/read");
            TemplateId           = "8ac3fc64-6eca-42ea-9e69-59f4c7b60eb2";
            Version              = "1";
        }
        AADRoleDefinition 42f0a23b-94d2-4f0d-ac35-901a3ae25d42
        {
            Credential           = $Credscredential;
            Description          = "Can manage Office apps cloud services, including policy and settings management, and manage the ability to select, unselect and publish 'what's new' feature content to end-user's devices.";
            DisplayName          = "Office Apps Administrator";
            Ensure               = "Present";
            Id                   = "2b745bdf-0803-4d80-aa65-822c4493daac";
            IsEnabled            = $True;
            Managedidentity      = $False;
            ResourceScopes       = @("/");
            RolePermissions      = @("microsoft.azure.serviceHealth/allEntities/allTasks","microsoft.azure.supportTickets/allEntities/allTasks","microsoft.office365.messageCenter/messages/read","microsoft.office365.serviceHealth/allEntities/allTasks","microsoft.office365.supportTickets/allEntities/allTasks","microsoft.office365.userCommunication/allEntities/allTasks","microsoft.office365.webPortal/allEntities/standard/read");
            TemplateId           = "2b745bdf-0803-4d80-aa65-822c4493daac";
            Version              = "1";
        }
        AADRoleDefinition 2ebec28c-b2ac-421d-b8c9-4770704b9f65
        {
            Credential           = $Credscredential;
            Description          = "Can manage network locations and review enterprise network design insights for Microsoft 365 Software as a Service applications.";
            DisplayName          = "Network Administrator";
            Ensure               = "Present";
            Id                   = "d37c8bed-0711-4417-ba38-b4abe66ce4c2";
            IsEnabled            = $True;
            Managedidentity      = $False;
            ResourceScopes       = @("/");
            RolePermissions      = @("microsoft.office365.network/locations/allProperties/allTasks","microsoft.office365.network/performance/allProperties/read","microsoft.office365.webPortal/allEntities/standard/read");
            TemplateId           = "d37c8bed-0711-4417-ba38-b4abe66ce4c2";
            Version              = "1";
        }
        AADRoleDefinition 93c2a2ca-b377-43ce-8de9-9e2d458ce274
        {
            Credential           = $Credscredential;
            Description          = "Can view and share dashboards and insights via the M365 Insights app.";
            DisplayName          = "Insights Business Leader";
            Ensure               = "Present";
            Id                   = "31e939ad-9672-4796-9c2e-873181342d2d";
            IsEnabled            = $True;
            Managedidentity      = $False;
            ResourceScopes       = @("/");
            RolePermissions      = @("microsoft.insights/reports/allProperties/read","microsoft.insights/programs/allProperties/update");
            TemplateId           = "31e939ad-9672-4796-9c2e-873181342d2d";
            Version              = "1";
        }
        AADRoleDefinition 14397757-a3c4-4500-b76e-f66b94c4c3b3
        {
            Credential           = $Credscredential;
            Description          = "Can perform management related tasks on Teams certified devices.";
            DisplayName          = "Teams Devices Administrator";
            Ensure               = "Present";
            Id                   = "3d762c5a-1b6c-493f-843e-55a3b42923d4";
            IsEnabled            = $True;
            Managedidentity      = $False;
            ResourceScopes       = @("/");
            RolePermissions      = @("microsoft.office365.webPortal/allEntities/standard/read","microsoft.teams/devices/standard/read");
            TemplateId           = "3d762c5a-1b6c-493f-843e-55a3b42923d4";
            Version              = "1";
        }
        AADRoleDefinition 61beffd8-9f33-4899-8173-bea2dcea5fff
        {
            Credential           = $Credscredential;
            Description          = "Can create and manage all aspects of attack simulation campaigns.";
            DisplayName          = "Attack Simulation Administrator";
            Ensure               = "Present";
            Id                   = "c430b396-e693-46cc-96f3-db01bf8bb62a";
            IsEnabled            = $True;
            Managedidentity      = $False;
            ResourceScopes       = @("/");
            RolePermissions      = @("microsoft.office365.protectionCenter/attackSimulator/payload/allProperties/allTasks","microsoft.office365.protectionCenter/attackSimulator/reports/allProperties/read","microsoft.office365.protectionCenter/attackSimulator/simulation/allProperties/allTasks");
            TemplateId           = "c430b396-e693-46cc-96f3-db01bf8bb62a";
            Version              = "1";
        }
        AADRoleDefinition 505e70e1-797b-4a8f-9901-7dee3621a4f8
        {
            Credential           = $Credscredential;
            Description          = "Can create attack payloads that an administrator can initiate later.";
            DisplayName          = "Attack Payload Author";
            Ensure               = "Present";
            Id                   = "9c6df0f2-1e7c-4dc3-b195-66dfbd24aa8f";
            IsEnabled            = $True;
            Managedidentity      = $False;
            ResourceScopes       = @("/");
            RolePermissions      = @("microsoft.office365.protectionCenter/attackSimulator/payload/allProperties/allTasks","microsoft.office365.protectionCenter/attackSimulator/reports/allProperties/read");
            TemplateId           = "9c6df0f2-1e7c-4dc3-b195-66dfbd24aa8f";
            Version              = "1";
        }
        AADRoleDefinition 7e3bc344-1455-4aa0-b7c1-976679f71fd1
        {
            Credential           = $Credscredential;
            Description          = "Can see only tenant level aggregates in Microsoft 365 Usage Analytics and Productivity Score.";
            DisplayName          = "Usage Summary Reports Reader";
            Ensure               = "Present";
            Id                   = "75934031-6c7e-415a-99d7-48dbd49e875e";
            IsEnabled            = $True;
            Managedidentity      = $False;
            ResourceScopes       = @("/");
            RolePermissions      = @("microsoft.office365.network/performance/allProperties/read","microsoft.office365.usageReports/allEntities/standard/read","microsoft.office365.webPortal/allEntities/standard/read");
            TemplateId           = "75934031-6c7e-415a-99d7-48dbd49e875e";
            Version              = "1";
        }
        AADRoleDefinition d64746d7-9b93-4798-a9fc-8ff8f911c209
        {
            Credential           = $Credscredential;
            Description          = "Can configure knowledge, learning, and other intelligent features.";
            DisplayName          = "Knowledge Administrator";
            Ensure               = "Present";
            Id                   = "b5a8dcf3-09d5-43a9-a639-8e29ef291470";
            IsEnabled            = $True;
            Managedidentity      = $False;
            ResourceScopes       = @("/");
            RolePermissions      = @("microsoft.directory/groups.security/create","microsoft.directory/groups.security/createAsOwner","microsoft.directory/groups.security/delete","microsoft.directory/groups.security/basic/update","microsoft.directory/groups.security/members/update","microsoft.directory/groups.security/owners/update","microsoft.office365.knowledge/contentUnderstanding/allProperties/allTasks","microsoft.office365.knowledge/knowledgeNetwork/allProperties/allTasks","microsoft.office365.knowledge/learningSources/allProperties/allTasks","microsoft.office365.protectionCenter/sensitivityLabels/allProperties/read","microsoft.office365.sharePoint/allEntities/allTasks","microsoft.office365.supportTickets/allEntities/allTasks","microsoft.office365.webPortal/allEntities/standard/read");
            TemplateId           = "b5a8dcf3-09d5-43a9-a639-8e29ef291470";
            Version              = "1";
        }
        AADRoleDefinition 42004511-444e-4115-bb5d-b47ddba0b765
        {
            Credential           = $Credscredential;
            Description          = "Has access to topic management dashboard and can manage content.";
            DisplayName          = "Knowledge Manager";
            Ensure               = "Present";
            Id                   = "744ec460-397e-42ad-a462-8b3f9747a02c";
            IsEnabled            = $True;
            Managedidentity      = $False;
            ResourceScopes       = @("/");
            RolePermissions      = @("microsoft.directory/groups.security/create","microsoft.directory/groups.security/createAsOwner","microsoft.directory/groups.security/delete","microsoft.directory/groups.security/basic/update","microsoft.directory/groups.security/members/update","microsoft.directory/groups.security/owners/update","microsoft.office365.knowledge/contentUnderstanding/analytics/allProperties/read","microsoft.office365.knowledge/knowledgeNetwork/topicVisibility/allProperties/allTasks","microsoft.office365.sharePoint/allEntities/allTasks","microsoft.office365.supportTickets/allEntities/allTasks","microsoft.office365.webPortal/allEntities/standard/read");
            TemplateId           = "744ec460-397e-42ad-a462-8b3f9747a02c";
            Version              = "1";
        }
        AADRoleDefinition d21e3eed-589b-44a9-9267-ba9719761a47
        {
            Credential           = $Credscredential;
            Description          = "Can manage domain names in cloud and on-premises.";
            DisplayName          = "Domain Name Administrator";
            Ensure               = "Present";
            Id                   = "8329153b-31d0-4727-b945-745eb3bc5f31";
            IsEnabled            = $True;
            Managedidentity      = $False;
            ResourceScopes       = @("/");
            RolePermissions      = @("microsoft.directory/domains/allProperties/allTasks","microsoft.office365.supportTickets/allEntities/allTasks","microsoft.office365.webPortal/allEntities/standard/read");
            TemplateId           = "8329153b-31d0-4727-b945-745eb3bc5f31";
            Version              = "1";
        }
        AADRoleDefinition 762686cf-1667-474d-a179-7224317c50a4
        {
            Credential           = $Credscredential;
            Description          = "Define and manage the definition of custom security attributes.";
            DisplayName          = "Attribute Definition Administrator";
            Ensure               = "Present";
            Id                   = "8424c6f0-a189-499e-bbd0-26c1753c96d4";
            IsEnabled            = $True;
            Managedidentity      = $False;
            ResourceScopes       = @("/");
            RolePermissions      = @("microsoft.directory/attributeSets/allProperties/allTasks","microsoft.directory/customSecurityAttributeDefinitions/allProperties/allTasks");
            TemplateId           = "8424c6f0-a189-499e-bbd0-26c1753c96d4";
            Version              = "1";
        }
        AADRoleDefinition 7bfdccee-1c50-4012-bbd6-4e041d97b209
        {
            Credential           = $Credscredential;
            Description          = "Assign custom security attribute keys and values to supported Azure AD objects.";
            DisplayName          = "Attribute Assignment Administrator";
            Ensure               = "Present";
            Id                   = "58a13ea3-c632-46ae-9ee0-9c0d43cd7f3d";
            IsEnabled            = $True;
            Managedidentity      = $False;
            ResourceScopes       = @("/");
            RolePermissions      = @("microsoft.directory/attributeSets/allProperties/read","microsoft.directory/customSecurityAttributeDefinitions/allProperties/read","microsoft.directory/devices/customSecurityAttributes/read","microsoft.directory/devices/customSecurityAttributes/update","microsoft.directory/servicePrincipals/customSecurityAttributes/read","microsoft.directory/servicePrincipals/customSecurityAttributes/update","microsoft.directory/users/customSecurityAttributes/read","microsoft.directory/users/customSecurityAttributes/update");
            TemplateId           = "58a13ea3-c632-46ae-9ee0-9c0d43cd7f3d";
            Version              = "1";
        }
        AADRoleDefinition 9110e75d-aa94-43e3-9c19-2348ff4a2ae7
        {
            Credential           = $Credscredential;
            Description          = "Read the definition of custom security attributes.";
            DisplayName          = "Attribute Definition Reader";
            Ensure               = "Present";
            Id                   = "1d336d2c-4ae8-42ef-9711-b3604ce3fc2c";
            IsEnabled            = $True;
            Managedidentity      = $False;
            ResourceScopes       = @("/");
            RolePermissions      = @("microsoft.directory/attributeSets/allProperties/read","microsoft.directory/customSecurityAttributeDefinitions/allProperties/read");
            TemplateId           = "1d336d2c-4ae8-42ef-9711-b3604ce3fc2c";
            Version              = "1";
        }
        AADRoleDefinition 576c3b71-19fe-497b-9625-8152c20d1f6f
        {
            Credential           = $Credscredential;
            Description          = "Read custom security attribute keys and values for supported Azure AD objects.";
            DisplayName          = "Attribute Assignment Reader";
            Ensure               = "Present";
            Id                   = "ffd52fa5-98dc-465c-991d-fc073eb59f8f";
            IsEnabled            = $True;
            Managedidentity      = $False;
            ResourceScopes       = @("/");
            RolePermissions      = @("microsoft.directory/attributeSets/allProperties/read","microsoft.directory/customSecurityAttributeDefinitions/allProperties/read","microsoft.directory/devices/customSecurityAttributes/read","microsoft.directory/servicePrincipals/customSecurityAttributes/read","microsoft.directory/users/customSecurityAttributes/read");
            TemplateId           = "ffd52fa5-98dc-465c-991d-fc073eb59f8f";
            Version              = "1";
        }
        AADRoleDefinition 02b1b1d2-2303-42cc-8176-463f02a40f05
        {
            Credential           = $Credscredential;
            Description          = "Can create or update Exchange Online recipients within the Exchange Online organization.";
            DisplayName          = "Exchange Recipient Administrator";
            Ensure               = "Present";
            Id                   = "31392ffb-586c-42d1-9346-e59415a2cc4e";
            IsEnabled            = $True;
            Managedidentity      = $False;
            ResourceScopes       = @("/");
            RolePermissions      = @("microsoft.office365.exchange/recipients/allProperties/allTasks","microsoft.office365.exchange/migration/allProperties/allTasks");
            TemplateId           = "31392ffb-586c-42d1-9346-e59415a2cc4e";
            Version              = "1";
        }
        AADRoleDefinition 4117ccf4-612b-43cb-a710-3900a3c67a87
        {
            Credential           = $Credscredential;
            Description          = "Manage access using Azure AD for identity governance scenarios.";
            DisplayName          = "Identity Governance Administrator";
            Ensure               = "Present";
            Id                   = "45d8d3c5-c802-45c6-b32a-1d70b5e1e86e";
            IsEnabled            = $True;
            Managedidentity      = $False;
            ResourceScopes       = @("/");
            RolePermissions      = @("microsoft.directory/accessReviews/definitions.applications/allProperties/allTasks","microsoft.directory/accessReviews/definitions.entitlementManagement/allProperties/allTasks","microsoft.directory/accessReviews/definitions.groups/allProperties/read","microsoft.directory/accessReviews/definitions.groups/allProperties/update","microsoft.directory/accessReviews/definitions.groups/create","microsoft.directory/accessReviews/definitions.groups/delete","microsoft.directory/accessReviews/allProperties/allTasks","microsoft.directory/entitlementManagement/allProperties/allTasks","microsoft.directory/groups/members/update","microsoft.directory/servicePrincipals/appRoleAssignedTo/update");
            TemplateId           = "45d8d3c5-c802-45c6-b32a-1d70b5e1e86e";
            Version              = "1";
        }
        AADRoleDefinition 4ce6ad87-08e9-4bf0-9a1e-bb2b0d78dc79
        {
            Credential           = $Credscredential;
            Description          = "Can manage all aspects of the Cloud App Security product.";
            DisplayName          = "Cloud App Security Administrator";
            Ensure               = "Present";
            Id                   = "892c5842-a9a6-463a-8041-72aa08ca3cf6";
            IsEnabled            = $True;
            Managedidentity      = $False;
            ResourceScopes       = @("/");
            RolePermissions      = @("microsoft.directory/cloudAppSecurity/allProperties/allTasks","microsoft.office365.webPortal/allEntities/standard/read");
            TemplateId           = "892c5842-a9a6-463a-8041-72aa08ca3cf6";
            Version              = "1";
        }
        AADRoleDefinition c5775a09-85e8-406b-857e-8535b7a9f322
        {
            Credential           = $Credscredential;
            Description          = "Can create and manage all aspects of Windows Update deployments through the Windows Update for Business deployment service.";
            DisplayName          = "Windows Update Deployment Administrator";
            Ensure               = "Present";
            Id                   = "32696413-001a-46ae-978c-ce0f6b3620d2";
            IsEnabled            = $True;
            Managedidentity      = $False;
            ResourceScopes       = @("/");
            RolePermissions      = "microsoft.windows.updatesDeployments/allEntities/allProperties/allTasks";
            TemplateId           = "32696413-001a-46ae-978c-ce0f6b3620d2";
            Version              = "1";
        }
        AADRoleDefinition fe890801-bf1b-423c-88ef-f71d5a664e87
        {
            Credential           = $Credscredential;
            Description          = "Can provision and manage all aspects of Cloud PCs.";
            DisplayName          = "Windows 365 Administrator";
            Ensure               = "Present";
            Id                   = "11451d60-acb2-45eb-a7d6-43d0f0125c13";
            IsEnabled            = $True;
            Managedidentity      = $False;
            ResourceScopes       = @("/");
            RolePermissions      = @("microsoft.directory/deletedItems.devices/delete","microsoft.directory/deletedItems.devices/restore","microsoft.directory/devices/create","microsoft.directory/devices/delete","microsoft.directory/devices/disable","microsoft.directory/devices/enable","microsoft.directory/devices/basic/update","microsoft.directory/devices/extensionAttributeSet1/update","microsoft.directory/devices/extensionAttributeSet2/update","microsoft.directory/devices/extensionAttributeSet3/update","microsoft.directory/devices/registeredOwners/update","microsoft.directory/devices/registeredUsers/update","microsoft.directory/groups.security/create","microsoft.directory/groups.security/delete","microsoft.directory/groups.security/basic/update","microsoft.directory/groups.security/classification/update","microsoft.directory/groups.security/dynamicMembershipRule/update","microsoft.directory/groups.security/members/update","microsoft.directory/groups.security/owners/update","microsoft.directory/groups.security/visibility/update","microsoft.directory/deviceManagementPolicies/standard/read","microsoft.directory/deviceRegistrationPolicy/standard/read","microsoft.azure.supportTickets/allEntities/allTasks","microsoft.cloudPC/allEntities/allProperties/allTasks","microsoft.office365.supportTickets/allEntities/allTasks","microsoft.office365.usageReports/allEntities/allProperties/read","microsoft.office365.webPortal/allEntities/standard/read");
            TemplateId           = "11451d60-acb2-45eb-a7d6-43d0f0125c13";
            Version              = "1";
        }
        AADRoleDefinition 8473abba-ead5-4f58-a536-8e61c207fec1
        {
            Credential           = $Credscredential;
            Description          = "Manage all aspects of Microsoft Edge.";
            DisplayName          = "Edge Administrator";
            Ensure               = "Present";
            Id                   = "3f1acade-1e04-4fbc-9b69-f0302cd84aef";
            IsEnabled            = $True;
            Managedidentity      = $False;
            ResourceScopes       = @("/");
            RolePermissions      = @("microsoft.edge/allEntities/allProperties/allTasks","microsoft.office365.supportTickets/allEntities/allTasks","microsoft.office365.webPortal/allEntities/standard/read");
            TemplateId           = "3f1acade-1e04-4fbc-9b69-f0302cd84aef";
            Version              = "1";
        }
        AADRoleDefinition 219a5b45-1061-4ec5-9631-d3f04fb6fd9e
        {
            Credential           = $Credscredential;
            Description          = "Manage all aspects of the Yammer service.";
            DisplayName          = "Yammer Administrator";
            Ensure               = "Present";
            Id                   = "810a2642-a034-447f-a5e8-41beaa378541";
            IsEnabled            = $True;
            Managedidentity      = $False;
            ResourceScopes       = @("/");
            RolePermissions      = @("microsoft.directory/groups/hiddenMembers/read","microsoft.directory/groups.unified/create","microsoft.directory/groups.unified/delete","microsoft.directory/groups.unified/restore","microsoft.directory/groups.unified/basic/update","microsoft.directory/groups.unified/members/update","microsoft.directory/groups.unified/owners/update","microsoft.office365.messageCenter/messages/read","microsoft.office365.network/performance/allProperties/read","microsoft.office365.serviceHealth/allEntities/allTasks","microsoft.office365.supportTickets/allEntities/allTasks","microsoft.office365.usageReports/allEntities/allProperties/read","microsoft.office365.webPortal/allEntities/standard/read","microsoft.office365.yammer/allEntities/allProperties/allTasks");
            TemplateId           = "810a2642-a034-447f-a5e8-41beaa378541";
            Version              = "1";
        }
        AADRoleDefinition 02df8907-92e6-4ba4-918a-711be88fdb93
        {
            Credential           = $Credscredential;
            Description          = "Manage and share Virtual Visits information and metrics from admin centers or the Virtual Visits app.";
            DisplayName          = "Virtual Visits Administrator";
            Ensure               = "Present";
            Id                   = "e300d9e7-4a2b-4295-9eff-f1c78b36cc98";
            IsEnabled            = $True;
            Managedidentity      = $False;
            ResourceScopes       = @("/");
            RolePermissions      = @("microsoft.virtualVisits/allEntities/allProperties/allTasks","microsoft.office365.webPortal/allEntities/standard/read");
            TemplateId           = "e300d9e7-4a2b-4295-9eff-f1c78b36cc98";
            Version              = "1";
        }
        AADRoleDefinition 0f4e4acd-c4c5-4efd-90cd-68878008de09
        {
            Credential           = $Credscredential;
            Description          = "Access the analytical capabilities in Microsoft Viva Insights and run custom queries.";
            DisplayName          = "Insights Analyst";
            Ensure               = "Present";
            Id                   = "25df335f-86eb-4119-b717-0ff02de207e9";
            IsEnabled            = $True;
            Managedidentity      = $False;
            ResourceScopes       = @("/");
            RolePermissions      = @("microsoft.insights/queries/allProperties/allTasks","microsoft.office365.supportTickets/allEntities/allTasks","microsoft.office365.webPortal/allEntities/standard/read");
            TemplateId           = "25df335f-86eb-4119-b717-0ff02de207e9";
            Version              = "1";
        }
        AADRoleDefinition 30f6a6d4-ea94-42e0-ab3a-f44f14128d32
        {
            Credential           = $Credscredential;
            Description          = "Create and manage all aspects warranty claims and entitlements for Microsoft manufactured hardware, like Surface and HoloLens.";
            DisplayName          = "Microsoft Hardware Warranty Administrator";
            Ensure               = "Present";
            Id                   = "1501b917-7653-4ff9-a4b5-203eaf33784f";
            IsEnabled            = $True;
            Managedidentity      = $False;
            ResourceScopes       = @("/");
            RolePermissions      = @("microsoft.hardware.support/shippingAddress/allProperties/allTasks","microsoft.hardware.support/shippingStatus/allProperties/read","microsoft.hardware.support/warrantyClaims/allProperties/allTasks","microsoft.office365.messageCenter/messages/read","microsoft.office365.supportTickets/allEntities/allTasks","microsoft.office365.webPortal/allEntities/standard/read");
            TemplateId           = "1501b917-7653-4ff9-a4b5-203eaf33784f";
            Version              = "1";
        }
        AADRoleDefinition c54fc903-1a53-4ee8-b0a4-93a6a9e4070b
        {
            Credential           = $Credscredential;
            Description          = "Create and read warranty claims for Microsoft manufactured hardware, like Surface and HoloLens.";
            DisplayName          = "Microsoft Hardware Warranty Specialist";
            Ensure               = "Present";
            Id                   = "281fe777-fb20-4fbb-b7a3-ccebce5b0d96";
            IsEnabled            = $True;
            Managedidentity      = $False;
            ResourceScopes       = @("/");
            RolePermissions      = @("microsoft.hardware.support/shippingAddress/allProperties/read","microsoft.hardware.support/warrantyClaims/createAsOwner","microsoft.office365.supportTickets/allEntities/allTasks","microsoft.office365.webPortal/allEntities/standard/read","microsoft.hardware.support/shippingStatus/allProperties/read","microsoft.hardware.support/warrantyClaims/allProperties/read");
            TemplateId           = "281fe777-fb20-4fbb-b7a3-ccebce5b0d96";
            Version              = "1";
        }
        AADRoleDefinition 427db6cd-3e2c-4733-b645-3869b8ecc2f8
        {
            Credential           = $Credscredential;
            Description          = "Create new Azure AD or Azure AD B2C tenants.";
            DisplayName          = "Tenant Creator";
            Ensure               = "Present";
            Id                   = "112ca1a2-15ad-4102-995e-45b0bc479a6a";
            IsEnabled            = $True;
            Managedidentity      = $False;
            ResourceScopes       = @("/");
            RolePermissions      = "microsoft.directory/tenantManagement/tenants/create";
            TemplateId           = "112ca1a2-15ad-4102-995e-45b0bc479a6a";
            Version              = "1";
        }
        AADRoleDefinition 99535cf5-e415-4ce6-9e33-2847caae3a6f
        {
            Credential           = $Credscredential;
            Description          = "Create and manage all aspects of workflows and tasks associated with Lifecycle Workflows in Azure AD.";
            DisplayName          = "Lifecycle Workflows Administrator";
            Ensure               = "Present";
            Id                   = "59d46f88-662b-457b-bceb-5c3809e5908f";
            IsEnabled            = $True;
            Managedidentity      = $False;
            ResourceScopes       = @("/");
            RolePermissions      = "microsoft.directory/lifecycleWorkflows/workflows/allProperties/allTasks";
            TemplateId           = "59d46f88-662b-457b-bceb-5c3809e5908f";
            Version              = "1";
        }
        AADRoleDefinition a7177d1a-88ea-45de-9df3-8194d8ee5a5e
        {
            Credential           = $Credscredential;
            Description          = "View product feedback, survey results, and reports to find training and communication opportunities.";
            DisplayName          = "User Experience Success Manager";
            Ensure               = "Present";
            Id                   = "27460883-1df1-4691-b032-3b79643e5e63";
            IsEnabled            = $True;
            Managedidentity      = $False;
            ResourceScopes       = @("/");
            RolePermissions      = @("microsoft.commerce.billing/purchases/standard/read","microsoft.office365.organizationalMessages/allEntities/allProperties/read","microsoft.office365.webPortal/allEntities/standard/read","microsoft.office365.messageCenter/messages/read","microsoft.office365.usageReports/allEntities/standard/read","microsoft.office365.network/performance/allProperties/read","microsoft.office365.serviceHealth/allEntities/allTasks");
            TemplateId           = "27460883-1df1-4691-b032-3b79643e5e63";
            Version              = "1";
        }
        AADRoleDefinition a3f28413-4c64-411d-8d1a-f0a8efe3b3ef
        {
            Credential           = $Credscredential;
            Description          = "Manage all aspects of Entra Permissions Management.";
            DisplayName          = "Permissions Management Administrator";
            Ensure               = "Present";
            Id                   = "af78dc32-cf4d-46f9-ba4e-4428526346b5";
            IsEnabled            = $True;
            Managedidentity      = $False;
            ResourceScopes       = @("/");
            RolePermissions      = "microsoft.permissionsManagement/allEntities/allProperties/allTasks";
            TemplateId           = "af78dc32-cf4d-46f9-ba4e-4428526346b5";
            Version              = "1";
        }
        AADRoleDefinition 837151cf-e616-46dc-a096-68155b7b749f
        {
            Credential           = $Credscredential;
            Description          = "Write, publish, manage, and review the organizational messages for end-users through Microsoft product surfaces.";
            DisplayName          = "Organizational Messages Writer";
            Ensure               = "Present";
            Id                   = "507f53e4-4e52-4077-abd3-d2e1558b6ea2";
            IsEnabled            = $True;
            Managedidentity      = $False;
            ResourceScopes       = @("/");
            RolePermissions      = @("microsoft.office365.organizationalMessages/allEntities/allProperties/allTasks","microsoft.office365.usageReports/allEntities/standard/read","microsoft.office365.webPortal/allEntities/standard/read");
            TemplateId           = "507f53e4-4e52-4077-abd3-d2e1558b6ea2";
            Version              = "1";
        }
System.Object[]    }
}

M365TenantConfig -ConfigurationData .\ConfigurationData.psd1 -Credential $Credential
