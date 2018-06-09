remove_packages = ['docker-common', \
                    'docker', \
                    'container-selinux', \
                    'docker-selinux', \
                    'docker-engine']

# remove previous docker installations
package remove_packages do
  action :remove
end
