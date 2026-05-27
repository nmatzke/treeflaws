library(ape)

# Example AA FASTA file
tmpstr = '>AAC75006.1
QSAADLIRDEHPQIIATILVHLKRAQAADILALFDERLRHDVMLRI
>AAP98818.1
EQLEKDLTSFHPIASAKVAIALSTED------DVMSPLHLSVILTL
>AAQ00836.1
AVQQSLLDRLRSGEVLELVERMSPDDRVRLFDELPAKVVRRLLAEL
>ABC76852.1
KILMDFTKSEHPQTIALILAHLKPEKSAQILESFTPEMQFEITRRM
>ABF88562.1
REQAELILHLQPAERRTWVRLLPPDDLADLVQAVEPEQAESILSQL
>ABY36902.1
DDQYELLTSLSLEETRLLLANLSPDDRTQLFEELPGQVTQKLLNLL
>ACD91087.1
DSQQNLLTALTKKDVTHILNSMSADDRTALLEELPGPVAQELLKLL
>ACI20682.1
SAIATMLQREHPQTIAIILAHLEPTQAAEVLSKFPEQFKIEISQRI
>ADB18917.1
QNLLTFVIDEHPQTIALILSHLPPAFGAEIMKGLPADRQLAVIRRI
'
# END tmpstr

write(tmpstr, "aa_example.fasta")

alignment = ape::read.FASTA(file="aa_example.fasta")
alignment_DNA = ape::read.FASTA(file="aa_example.fasta", type="DNA")
alignment_AA = ape::read.FASTA(file="aa_example.fasta", type="AA")

alignment_str = sapply(X=as.character(alignment), FUN=paste0, collapse="")
alignment_DNA_str = sapply(X=as.character(alignment_DNA), FUN=paste0, collapse="")
alignment_AA_str = sapply(X=as.character(alignment_AA), FUN=paste0, collapse="")

alignment_str
alignment_DNA_str
alignment_AA_str

# read.FASTA by default reads DNA, and silently drops AAs that don't match IUPAC DNA codes!
unname(sapply(X=alignment_str, FUN=nchar))
unname(sapply(X=alignment_DNA_str, FUN=nchar))
unname(sapply(X=alignment_AA_str, FUN=nchar))
