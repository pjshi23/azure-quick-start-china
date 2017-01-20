# Custom Images at Scale

<a href="https://portal.azure.cn/#create/Microsoft.Template/uri/https%3A%2F%2Fraw.githubusercontent.com%2Fpjshi23%2Fazure-quick-start-china%2Fmaster%2F301-custom-images-at-scale%2Fazuredeploy.json" target="_blank">
    <img src="http://azuredeploy.net/deploybutton.png"/>
</a>




### 这个模板是用来批量部署自定义image的。可以支持用scalesets/单独的instacnce/instance in avset等方式。

先决条件：

参考这个文档抓取image,保存template并记录下image url。

根据parameter的提示填上image url和选择批量部署的方式。

注：

普通的批量部署arm template不支持多storage account。本template是为了多存储账号和多vm的情况下编写。

template原理：

创建transfer vm来下载原storage account里的image vhd。通过blobxfer上传到多个storage account里。

根据storage account里的vhd部署vm。

由于牵涉vhd的上传下载，部署时间视storage account的个数会成正比。

之后会考虑优化。 ###



# 注意，在VM部署完成后，请一定把transfer VM删除，避免不必要的收费。 #

