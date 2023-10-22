(setq webjump-sites
      `(("Google" .
         [simple-query "https://www.google.com"
                       "https://www.google.com/search?q=" ""])

        ("Brave" .
         [simple-query "https://search.brave.com"
                       "https://search.brave.com/search?q=" ""])

        ("DuckDuckGo" .
         [simple-query "https://html.duckduckgo.com"
                       "https://html.duckduckgo.com/?q=" ""])
        ("EmacsWiki" .
         [simple-query "www.emacswiki.org"
                       "www.emacswiki.org/cgi-bin/wiki/" ""])

        ("StackOverflow" .
         [simple-query "https://stackoverflow.com"
                       "https://stackoverflow.com/search?q=emacs" ""])

        ("archwiki" .
         [simple-query "https://wiki.archlinux.org/title/Table_of_contents"
                       "https://wiki.archlinux.org/index.php?title=Special%3ASearch&fulltext=Search&search=" ""])

        ("aur" .
         [simple-query "https://aur.archlinux.org/"
                       "https://aur.archlinux.org/packages?K=" ""])

        ("aws-cli" .
         [simple-query "https://awscli.amazonaws.com/v2/documentation/api/latest/index.html"
                       "https://awscli.amazonaws.com/v2/documentation/api/latest/reference/" "/index.html"])

        ("aws-sdk-go" .
         [simple-query "https://pkg.go.dev/github.com/aws/aws-sdk-go-v2/service/"
                       "https://pkg.go.dev/github.com/aws/aws-sdk-go-v2/service/" ""])

        ("aws-iam" .
         [simple-query "https://docs.aws.amazon.com/service-authorization/latest/reference/reference_policies_actions-resources-contextkeys.html"
                       "https://docs.aws.amazon.com/service-authorization/latest/reference/list_amazon" ".html"])

        ("Kubernetes" .
         [simple-query "https://kubernetes.io/docs/reference/kubernetes-api/"
                       "https://www.google.com/search?q=site%3Akubernetes.io+" ""])))
