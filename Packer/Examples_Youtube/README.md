Source: https://developer.hashicorp.com/packer/plugins



Communicators:

Communicators are the mechanism Packer uses to upload files, execute scripts, etc. with the machine being created.
Communicators are configured within the builder section. Packer currently supports three kinds of communicators:

    none - No communicator will be used. If this is set, most provisioners also can't be used.

    ssh - An SSH connection will be established to the machine. This is usually the default.

    winrm - A WinRM connection will be established.

In addition to the above, some builders have custom communicators they can use. For example, the Docker builder has a "docker" communicator that uses docker exec and docker cp to execute scripts and copy files.



#Builders:

Builders create machines and generate images from those machines for various platforms. Packer also has some builders that perform helper tasks, like running provisioners.



#Data sources:

Data sources allow data to be fetched or computed for use elsewhere in locals and sources configuration. Use of data sources allows a Builder to make use of information defined outside of Packer.


#Provisioners

Provisioners use built-in and third-party software to install and configure the machine image after booting. Provisioners prepare the system, so you may want to use them for the following use cases:

    installing packages
    patching the kernel
    creating users
    downloading application code


#Post-Processors

Post-processors run after builders and provisioners. Post-processors are optional, and you can use them to upload artifacts, re-package files, and more. The documentation includes a page for each type of post-processor.


#Template User Variables

User variables allow your templates to be further configured with variables from the command-line, environment variables, Vault, or files. This lets you parameterize your templates so that you can keep secret tokens, environment-specific data, and other types of information out of your templates. This maximizes the portability of the template.
User variables are used by calling the {{user}} function in the form of {{user 'variable'}}.
Runtime Variables Example: packer build -var "description=nginx-serverbuild" -var "version=1.1" example7.json
                            packer build -var-file=variables.json  example7.json
{
  "variables": {
    "aws_access_key": "",
    "aws_secret_key": ""
  },

  "builders": [
    {
      "type": "amazon-ebs",
      "access_key": "{{user `aws_access_key`}}",
      "secret_key": "{{user `aws_secret_key`}}"
      // ...
    }
  ]
}

                            
#Environment Variables

Environment variables can be used within your template using user variables. The env function is available only within the default value of a user variable, allowing you to default a user variable to an environment variable.
{
  "variables": {
    "my_secret": "{{env `MY_SECRET`}}"
  }
}


Azure Image:
App registration under AD.
Create role assignment for the app under subscription.
create resource group to store images
to get azure ami's: az vm image list-publishers --location westus


Authentication

The AWS provider offers a flexible means of providing credentials for authentication. The following methods are supported, in this order, and explained below:

    Static credentials : Defined in configuration file
    Environment variables : Defined outside the file
    Shared credentials file : defined in .aws/credintials file
    EC2 Role : using IAM role.
