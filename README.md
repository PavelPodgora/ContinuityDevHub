If you use IntelliJ Idea:
        *      Click file
        *      New
        *      Create Project From Version Control
        *      Copy from github repository link and paste it into Idea
        *      Press Clone
        *      Name you project directory and do all steps till finish
        *      Change branch from master to your Own Branch and do following steps:

        Login to Abbvie devhub org or use your personal devhub org (limit 3 scratch orgs):
        **sfdx force:auth:web:login -d -a NameOfDevHubOrg**

        After login to dev hub it's time to create your scratch (org witch lives 30 days):
        **sfdx force:org:create -f config/project-scratch-def.json -d 30 -s -a NameofYourScratchOrg**

        If you got LIMIT Error please log into you dev hub org, in App Launcher open Active Scratch Orgs and delete 1, or you can use command to delete previous scratch:
        **sfdx force:org:delete -p**

        After successfull org creation need to push al the data:
        **sfdx force:source:push**   (use -f if you have conflicts and you want to overwrite all in your scratch from you source)

        You can also pubclish ommunity with this command OR do it mannualy from Setup:
        **sfdx force:community:publish --name "Name of Community"**

        Run the script from the folder below to set up a role for a scratch org user
        **scripts/apex/assignRoleToCurrentUser**

        Then open your org with next command
        **sfdx force:org:open**
        ---

        ***Useful SFDX commands:***
        ```
        sfdx force:auth:web:login -d -a [your dev hub alias name]
        sfdx force:org:open -u [your dev hub alias name]
        sfdx force:auth:web:login -r https://test.salesforce.com -a [your Full Sandbox alias name]
        sfdx force:auth:web:login -r https://test.salesforce.com -a [your Dev Sandbox alias name]
        sfdx force:limits:api:display -u [your dev hub or any other org alias name]
        sfdx force:org:create -f config/project-scratch-def.json -s -d 30 -a [your scratch org alias name]
        sfdx force:source:status
        sfdx force:source:push
        sfdx force:source:push -f
        sfdx force:source:push -u [user name / alias of scratch or sandbox]
        sfdx force:source:deploy -m ApexClass:MyApexClass
        sfdx force:source:deploy -m "CustomObject,ApexClass"
        sfdx force:source:deploy -m "ApexClass, Profile:My Profile, Profile: AnotherProfile"
        sfdx force:source:deploy -x manifest/package.xml
        sfdx force:source:pull
        sfdx force:source:pull -f
        sfdx force:source:retrieve -x manifest/package.xml
        sfdx force:data:tree:export -q "SELECT Name FROM Account" -d ./data
        sfdx force:data:tree:import --sobjecttreefiles data/Account.json
        sfdx force:org:list --all
        sfdx force:org:open
        sfdx force:user:password:generate
        sfdx force:user:display -u [your user name]
        sfdx force:config:set defaultusername=alias
        sfdx force:apex:execute -f scripts/apex/ClearData.apex
        ```


