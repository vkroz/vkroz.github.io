Installing Jekill to run git-gaes documebtation locally
====================================

1. Install latest ruby
    
        brew update && brew install ruby
        
2. Install jekyll (important to use gem installed by brew)

        /usr/local/bin/gem install jekyll bundler
        
3. Start jekill 

        cd ${project_home}
        jekyll serve
        
4. Open URL in browser

        open http://localhost:4000


