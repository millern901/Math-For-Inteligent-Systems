# import files
include("wikipedia_corpus.jl")
include("kmeans.jl")

using Kmeans
# 2-means
centroids1, labels1, j_hist1 = kmeans(article_histograms, 2)
centroids2, labels2, j_hist2 = kmeans(article_histograms, 2)

# 5-means
centroids3, labels3, j_hist3 = kmeans(article_histograms, 5)
centroids4, labels4, j_hist4 = kmeans(article_histograms, 5)

# 10-means
centroids5, labels5, j_hist5 = kmeans(article_histograms, 10)
centroids6, labels6, j_hist6 = kmeans(article_histograms, 10)

# plot 2-means j_hist 
using PyPlot
plt[:plot](j_hist1)
plt[:plot](j_hist2)
plt[:ylabel]("J-Clust")
plt[:xlabel]("Iteration")
plt[:show]

# The first run seems to have converged before the second run 
# but forms a worse clustering since it has a larger Jclust.

# plot 5-means j_hist 
plt[:plot](j_hist3)
plt[:plot](j_hist4)
plt[:ylabel]("J-Clust")
plt[:xlabel]("Iteration")
plt[:show]

# The first run seems to converge in more iterations than run two
# but both runs have similar Jclusts which means that both runs 
# have a similarly distributed end cluster. That doesn't necessarily 
# mean both clusters are the same just that they have the same 
# distribution of points. 

# plot 10-means j_hist 
plt[:plot](j_hist5)
plt[:plot](j_hist6)
plt[:ylabel]("J-Clust")
plt[:xlabel]("Iteration")
plt[:show]

# boths runs follow a very similar convergence path except for the 
# fact that run one takes two more iterations. Both runs have very 
# similar final Jclusts which means both have a similar end 
# distribution. 

using Kmeans
centroids, labels, j_hist = kmeans(article_histograms, 5)

article_titles[labels .== 1]
dictionary[sortperm(centroids[1],rev=true)]
# the topic discovered seems to have something relating to weather and meterology.
# the top three words are weather, wind and pressure which in the context of meterology 
# makes sense since all three words are heavily related to the atmosphere.

article_titles[labels .== 2]
dictionary[sortperm(centroids[2],rev=true)]
# the topic discovered seems to have something relating to communication and sound.
# the top three words are signal, radio and frequency which in the context of sound and communitcation
# makes sense since radios work off of signals and frequencies to allow people to communicate.

article_titles[labels .== 3]
dictionary[sortperm(centroids[3],rev=true)]
# the topic discovered seems to have something relating to pokemon. 
# the top three words are pokemon, game and games which in the context 
# of pokemon makes sence since pokemon is a video game and anime. The problem 
# with this cluster seems to be that the lack of clusters have made articles
# like wavelengths and wind which sould most likely belong to clusters two 
# and one respectively. The overall most frequent words are definetly relevant. 

article_titles[labels .== 4]
dictionary[sortperm(centroids[4],rev=true)]
# the topic discovered seems to have something relating to international affairs.
# the top three words are nations, international and member. All of these words are 
# very connected to the topic of international affairs. One of the words in actually in 
# the name of the topic. As we go down the list we start to see that the other more popular 
# make sense give the context. 

article_titles[labels .== 5]
dictionary[sortperm(centroids[5],rev=true)]
# the topic discovered seems to have something relating to art.
# the three most popular words are painting, art and paintings which
# make sense in the context of art. Additionally, looking further into 
# the list we see a lot of the other words make sense in the topic 
# of art.